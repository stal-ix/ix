package main

import (
	"crypto"
	"crypto/ed25519"
	"crypto/rand"
	"crypto/x509"
	"crypto/x509/pkix"
	"encoding/pem"
	"math/big"
	"os"
	"io"
	"time"
)

var (
    ENTROPY io.Reader
)

func RandRead() io.Reader {
	if ENTROPY == nil {
		res, err := os.Open("qw")
		if err != nil {
			panic(err)
		}
		ENTROPY = res
	}
	return ENTROPY
}

func GenerateCert(priv crypto.PrivateKey) (*x509.Certificate) {
	serialNumberLimit := new(big.Int).Lsh(big.NewInt(1), 128)
	serialNumber, err := rand.Int(RandRead(), serialNumberLimit)
	if err != nil {
		panic(err)
	}

	cert := x509.Certificate{
		SerialNumber: serialNumber,
		Subject: pkix.Name{
			Organization: []string{"SSH3Organization"},
		},
		NotBefore: time.Now(),
		NotAfter:  time.Now().Add(time.Hour * 24 * 365 * 10),

		KeyUsage:              x509.KeyUsageKeyEncipherment | x509.KeyUsageDigitalSignature | x509.KeyUsageCertSign,
		ExtKeyUsage:           []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
		BasicConstraintsValid: true,
		DNSNames:              []string{"*", "selfsigned.ssh3"},
		IsCA:                  true,
	}

	return &cert
}

func DumpCertAndKeyToFiles(cert *x509.Certificate, pubkey crypto.PublicKey, privkey crypto.PrivateKey, certPath, keyPath string) {
	certBytes, err := x509.CreateCertificate(RandRead(), cert, cert, pubkey, privkey)
	if err != nil {
		panic(err)
	}
	certFile, err := os.Create(certPath)
	if err != nil {
		panic(err)
	}
	defer certFile.Close()
	err = pem.Encode(certFile, &pem.Block{Type: "CERTIFICATE", Bytes: certBytes})
	if err != nil {
		panic(err)
	}
	keyFile, err := os.OpenFile(keyPath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, 0600)
	if err != nil {
		panic(err)
	}
	defer keyFile.Close()

	keyBytes, err := x509.MarshalPKCS8PrivateKey(privkey)
	if err != nil {
		panic(err)
	}
	err = pem.Encode(keyFile, &pem.Block{Type: "PRIVATE KEY", Bytes: keyBytes})
	if err != nil {
		panic(err)
	}
}

func main() {
	pubkey, privkey, err := ed25519.GenerateKey(RandRead())
	if err != nil {
	    panic(err)
	}
	cert := GenerateCert(privkey)
	DumpCertAndKeyToFiles(cert, pubkey, privkey, "cert", "key")
}
