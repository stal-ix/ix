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

func GenerateCert(priv crypto.PrivateKey, reader io.Reader) (*x509.Certificate) {
	serialNumberLimit := new(big.Int).Lsh(big.NewInt(1), 128)
	serialNumber, err := rand.Int(reader, serialNumberLimit)
	if err != nil {
		panic(err)
	}
	from := time.Unix(0, 0)
	cert := x509.Certificate{
		SerialNumber: serialNumber,
		Subject: pkix.Name{
			Organization: []string{"SSH3Organization"},
		},
		NotBefore: from,
		NotAfter:  from.Add(time.Hour * 24 * 365 * 100),
		KeyUsage:              x509.KeyUsageKeyEncipherment | x509.KeyUsageDigitalSignature | x509.KeyUsageCertSign,
		ExtKeyUsage:           []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
		BasicConstraintsValid: true,
		DNSNames:              []string{"*", "selfsigned.ssh3"},
		IsCA:                  true,
	}

	return &cert
}

func DumpCertAndKeyToFiles(cert *x509.Certificate, pubkey crypto.PublicKey, privkey crypto.PrivateKey, certPath, keyPath string, reader io.Reader) {
	certBytes, err := x509.CreateCertificate(reader, cert, cert, pubkey, privkey)
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
	reader, err := os.Open(os.Getenv("ENTROPY"))
	if err != nil {
		panic(err)
	}
	pubkey, privkey, err := ed25519.GenerateKey(reader)
	if err != nil {
	    panic(err)
	}
	cert := GenerateCert(privkey, reader)
	DumpCertAndKeyToFiles(cert, pubkey, privkey, "cert", "key", reader)
}
