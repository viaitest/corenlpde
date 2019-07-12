FROM java:jre-alpine

MAINTAINER vk <vakkula@gmail.com>

RUN apk add --update --no-cache \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-german-corenlp-2018-10-05-models.jar

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -mx4g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000