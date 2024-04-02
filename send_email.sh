#!/bin/bash  
  
# 接收者的邮箱地址  
TO="996343800@qq.com"  
  
# 邮件主题  
SUBJECT="Subject of the Email"  
  
# 邮件正文  
BODY="This is the body of the email."  
  
# 使用 echo 和管道将邮件正文和头部信息发送给 msmtp  
echo "$BODY" | msmtp --account=gmail --from="your-email@gmail.com" --to="$TO" --subject="$SUBJECT"
