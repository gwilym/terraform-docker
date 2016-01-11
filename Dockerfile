FROM golang:1.5-alpine

RUN mkdir -p /go/src/github.com/hashicorp/terraform
WORKDIR /go/src/github.com/hashicorp/terraform

ENV TERRAFORM_BRANCH=master
ENV TERRAFORM_REF=c7573de75b196c474ba70de7f908afa8b83f8b41
ENV XC_ARCH=amd64
ENV XC_OS=linux

# NOTE terraform's `updatedeps` and `bin` makes run some commands which can fail :( (such as with 'no buildable Go source files')

RUN apk add --update bash git go make zip && \
	git clone --branch "${TERRAFORM_BRANCH}" --single-branch https://github.com/hashicorp/terraform . && \
	git reset --hard "${TERRAFORM_REF}" && \
	(make updatedeps; make bin; exit 0) && \
	rm -rf /go/src /usr/local/go && \
	apk del --purge bash git go zip
