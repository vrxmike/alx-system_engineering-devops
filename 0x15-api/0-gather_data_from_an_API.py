#!/usr/bin/python3
"""A script that gathers employee name completed
tasks and total number of tasks from an API
"""
import json
import requests
import sys


if __name__ == '__main__':
    r = requests.get("https://jsonplaceholder.typicode.com/users/" +
                     sys.argv[1])
    dict = json.loads(r.text)
    name = dict.get('name')
    resp = requests.get("https://jsonplaceholder.typicode.com/todos/" +
                        "?userId=" + sys.argv[1])
    todos = json.loads(resp.text)
    tasks = len(todos)
    completed = [task for task in todos if task.get('completed')]
    done = len(completed)
    print("Employee {} is done with tasks({}/{})".format(name, done, tasks))
    for task in completed:
        print("\t", task.get('title'))
