# photomail
Easily send email with handwritten messages

## Inspiration
Old school always wins! We created a novel way to send email with a pen and paper.

## What it does
Write an email and message down on a piece of paper. Take a picture and it will digitize the text and prepare an email. All that’s left to do is hit “Send”!

## How we built it
Flutter client, flask webserver, google-cloud vision for handwriting detection, ngrok for hosting.

## Challenges we ran into
Flutter didn't work, web server broke, cloud vision broke, but we pulled through at the end.

## Accomplishments that we're proud of
It works for real. We’re proud of our use of Google’s Cloud Vision API. In particular, we had to preprocess the image before sending it to the Google API. Then, our python server processes the API results by extracting the most likely text, and spaces between words. Finally it seamlessly sends the parsed text to the front end application. Another thing we’re proud of is building a cross-platform application using flutter for a seamless user experience across Android, iOS, and web.

## Built With
- computer-vision
- flask
- flutter
- google-cloud
- ngrok
- python

#### Check it out on [Devpost](https://devpost.com/software/photomail)
