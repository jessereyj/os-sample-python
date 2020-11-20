from flask import Flask
from flask_mail import Mail,Message

app = Flask(__name__)
mail = Mail(app)

app.config['MAIL_SERVER'] = 'smtp.sendgrid.net'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USERNAME'] = 'apikey'
app.config['MAIL_PASSWORD'] = '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'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = False
mail = Mail(app)

def notify():
  msg = Message('Hello World',sender='jesserey.joseph@ibm.com',recipients=['jessereyj@gmail.com'])
  msg.body = "Hello Flask message sent from Jebong"
  with app.app_context():
    mail.send(msg)
    return "Sent"

if __name__ == '__main__':
  notify()

