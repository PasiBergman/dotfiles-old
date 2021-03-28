curl --url 'smtp://email-smtp.eu-central-1.amazonaws.com:587' --ssl-reqd \
  --mail-from 'from@address.dom' --mail-rcpt 'to@address.dom' \
  --upload-file ./testmail.txt --user '<username>:<password>'
