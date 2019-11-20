#!/bin/bash
uri=$(cat $1)
curl -X POST "http://actionapi:3000/${uri}" >> /tmp/kubecon/results
