#!/bin/bash

function extractvendor {
    grep "Subject:" testemail | sed 's/\(Subject: #Accounts \)\(.*\)/\2/'
}
function extractamount {
    grep "A:" testemail | sed 's/\(A: \)\(.*\)/\$\2/'
}
function extractfrom {
    grep "F:" testemail | sed 's/\(F: \)\(.*\)/\2/'
}
function extractto {
    grep "T:" testemail | sed 's/\(T: \)\(.*\)/\2/'
}
vendorname=$(extractvendor)
transamount=$(extractamount)
accountfrom=$(extractfrom)
accountto=$(extractto)

echo "$(date +%Y/%m/%d) $vendorname
$accountfrom      $transamount
$accountto" >> testledger.ledger


