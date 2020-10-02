#!/bin/bash

export jump_host='sjb786@tinky-winky.cs.bham.ac.uk'
export host='sjb786@cca-lg04-011'
export local_path=$1


scp -o ProxyCommand="ssh $jump_host nc $host 22" host:/tmp/NC2019MRI $local_path 
