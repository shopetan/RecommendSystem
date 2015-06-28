#!/usr/bin/python
# coding:utf-8

import MeCab,re

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
                    noun[lineCount].append(replaceNode)
            node = node.next
        noun.append([])
        lineCount += 1
    return noun

documents = readDocument()
noun = getNounFromDocument(documents)

print noun
