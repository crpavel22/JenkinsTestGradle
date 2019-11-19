#!/bin/bash
test $(curl localhost:8785/sum?a=1\&b=2) -eq 3