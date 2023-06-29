/* Copyright (c) 2014 The Chromium OS Authors. All rights reserved.
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

#ifndef RATE_ESTIMATOR_H_
#define RATE_ESTIMATOR_H_

#include <time.h>

/* Hold information to calculate linear least square from
 * several (x, y) samples.
 */
struct least_square {
	double sum_x;
	double sum_y;
	double sum_xy;
	double sum_x2;
	int num_samples;
};

/* An estimator holding the required information to determine the actual frame
 * rate of an audio device.
 * Members:
 *    last_level - Buffer level of the audio device at last check time.
 *    level_diff - Number of frames written to or read from audio device since
 *        the last check time. Rate estimator will use this change plus the
 *        difference of buffer level to derive the number of frames audio
 *        device has actually processed.
 *    window_start_ts - The start time of the current window.
 *    window_size - The size of the window.
 *    window_frames - The number of frames accumulated in current window.
 *    lsq - The helper used to estimate sample rate.
 */
struct rate_estimator {
	int last_level;
	int level_diff;
	struct timespec window_start_ts;
	struct timespec window_size;
	int window_frames;
	struct least_square lsq;
	double smooth_factor;
	double estimated_rate;
};

/* Creates a rate estimator.
 * Args:
 *    rate - The initial value to estimate rate from.
 *    window_size - The window size of the rate estimator.
 *    smooth_factor - The coefficient used to calculate moving average
 *        from old estimated rate values.
 */
struct rate_estimator *rate_estimator_create(unsigned int rate,
					     const struct timespec *window_size,
					     double smooth_factor);
/* Destroy a rate estimator. */
void rate_estimator_destroy(struct rate_estimator *re);

/* Adds additional frames transmitted to/from audio device.
 * Args:
 *    re - The rate estimator.
 *    fr - The number of frames written to the device.  For input, this should
 *      be negative to indicate how many samples were read.
 */
void rate_estimator_add_frames(struct rate_estimator *re, int fr);

/* Checks the timestamp and buffer level difference since last check time,
 * and use them as a new sample to update the estimated rate.
 * Args:
 *    re - The rate estimator.
 *    level - The current buffer level of audio device.
 *    now - The time at which this function is called.
 * Returns:
 *    True if the estimated rate is updated and window is reset,
 *    otherwise false.
 */
int rate_estimator_check(struct rate_estimator *re, int level,
			 struct timespec *now);

/* Gets the estimated rate. */
double rate_estimator_get_rate(struct rate_estimator *re);

/* Resets the estimated rate. */
void rate_estimator_reset_rate(struct rate_estimator *re, unsigned int rate);

#endif /* RATE_ESTIMATOR_H_ */
