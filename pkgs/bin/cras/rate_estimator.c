/* Copyright (c) 2014 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
#include "math.h"

#include "cras_util.h"
#include "rate_estimator.h"

/* The max rate skew that considered reasonable */
#define MAX_RATE_SKEW 100

static void least_square_reset(struct least_square *lsq)
{
	memset(lsq, 0, sizeof(*lsq));
}

void least_square_add_sample(struct least_square *lsq, double x, double y)
{
	lsq->sum_x += x;
	lsq->sum_y += y;
	lsq->sum_xy += x * y;
	lsq->sum_x2 += x * x;
	lsq->num_samples++;
}

double least_square_best_fit_slope(struct least_square *lsq)
{
	double num, denom;
	num = lsq->num_samples * lsq->sum_xy - lsq->sum_x * lsq->sum_y;
	denom = lsq->num_samples * lsq->sum_x2 - lsq->sum_x * lsq->sum_x;
	return num / denom;
}

void rate_estimator_destroy(struct rate_estimator *re)
{
	if (re)
		free(re);
}

struct rate_estimator *rate_estimator_create(unsigned int rate,
					     const struct timespec *window_size,
					     double smooth_factor)
{
	struct rate_estimator *re;

	re = (struct rate_estimator *)calloc(1, sizeof(*re));
	if (re == NULL)
		return NULL;

	re->window_size = *window_size;
	re->estimated_rate = rate;
	re->smooth_factor = smooth_factor;

	return re;
}

void rate_estimator_add_frames(struct rate_estimator *re, int fr)
{
	re->level_diff += fr;
}

double rate_estimator_get_rate(struct rate_estimator *re)
{
	return re->estimated_rate;
}

void rate_estimator_reset_rate(struct rate_estimator *re, unsigned int rate)
{
	re->estimated_rate = rate;
	least_square_reset(&re->lsq);
	re->window_start_ts.tv_sec = 0;
	re->window_start_ts.tv_nsec = 0;
	re->window_frames = 0;
	re->level_diff = 0;
	re->last_level = 0;
}

int rate_estimator_check(struct rate_estimator *re, int level,
			 struct timespec *now)
{
	struct timespec td;

	if (re->window_start_ts.tv_sec == 0) {
		re->window_start_ts = *now;
		return 0;
	}

	subtract_timespecs(now, &re->window_start_ts, &td);
	re->window_frames += abs(re->last_level - level + re->level_diff);
	re->level_diff = 0;
	re->last_level = level;

	least_square_add_sample(&re->lsq,
				td.tv_sec + (double)td.tv_nsec / 1000000000L,
				re->window_frames);
	if (timespec_after(&td, &re->window_size) && re->lsq.num_samples > 1) {
		double rate = least_square_best_fit_slope(&re->lsq);
		if (fabs(re->estimated_rate - rate) < MAX_RATE_SKEW)
			re->estimated_rate =
				rate * (1 - re->smooth_factor) +
				re->smooth_factor * re->estimated_rate;
		least_square_reset(&re->lsq);
		re->window_start_ts = *now;
		re->window_frames = 0;
		return 1;
	}
	return 0;
}
