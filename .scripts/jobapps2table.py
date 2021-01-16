#!/usr/bin/env python3
def get_applications():
    apps_file = open("/home/sam/org/job-applications.org", "r").read()
    jobs = apps_file.split("*")[1:]
    jobs = list(map(lambda s: s[1:].split(" ", 1), jobs))
    jobs = list(map(lambda j: [j[0]] + j[1].split("\n")[0:3], jobs))
    return jobs


def main():
    applications = get_applications()
    table_str = """* Job Applications Table
| Stage | Company | Date | Role |
|-------+---------+------+------|\n"""
    for application in applications:
        table_str += f"| {application[0]} | {application[1].split(' ', 2)[1]} | {application[2][1:].split(' ', 1)[1]} | {application[3][1:].split(' ', 1)[1]} |\n"

    return table_str


print(main())
