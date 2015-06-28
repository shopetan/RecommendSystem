#!/usr/bin/python
# coding:utf-8

import MeCab,re
import nltk

def readDocument():
    f = open('documents.txt')
    lines = f.readlines()
    f.close

    documents = []

    for line in lines:
        documents.append(line)
    return documents


def getNounFromDocument(documents):
    lineCount = 0
    noun = [[]]

    for line in documents:
        mt = MeCab.Tagger("-Ochasen")
        node = mt.parseToNode(line)
        while node:
            if node.feature.split(",")[0] == "名詞":
                replaceNode = re.sub( re.compile( "[!-/:-@[-`{-~]" ), "", node.surface )
                if replaceNode != "" and replaceNode != " ":
                    replaceNode = replaceNode.decode('utf-8')
                    noun[lineCount].append(replaceNode)
            node = node.next
        noun.append([])
        lineCount += 1
    return noun

def writeTFIDFResultFromNouns(noun):
    collection = nltk.TextCollection(noun)
    uniqTerms = list(set(collection))
    sortNoun = {}

    f = open("descriptionNoun.txt","w")

    for doc in noun:
        try:
            for term in uniqTerms:
                sortNoun.update({term:collection.tf_idf(term, doc)})
                # print "%s : %f" % (term, collection.tf_idf(term, doc))
        except ZeroDivisionError:
            print 'error!'
        
    wordCount = 0
    for k, v in sorted(sortNoun.items(), key=lambda x:x[1],reverse=True):
        if wordCount < 100:
            if v > 0.0:
                f.write(k.encode("utf-8"))
                f.write(":")
                f.write(str(v).encode("utf-8"))
                f.write("\n")
            wordCount += 1
    f.close

documents = readDocument()
noun = getNounFromDocument(documents)

writeTFIDFResultFromNouns(noun)
