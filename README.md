# projectHire: Pyrite

[![Code Climate](https://codeclimate.com/repos/55cb9913e30ba00a240009bb/badges/e7437e1a3d9f82b192d6/gpa.svg)](https://codeclimate.com/repos/55cb9913e30ba00a240009bb/feed)
[![Test Coverage](https://codeclimate.com/repos/55cb9913e30ba00a240009bb/badges/e7437e1a3d9f82b192d6/coverage.svg)](https://codeclimate.com/repos/55cb9913e30ba00a240009bb/coverage)
[![Circle CI](https://circleci.com/gh/projecthire/pyrite.svg?style=shield&circle-token=0933776241a3ed7dd68f89c395f3c2a1e0a7fb8d)](https://circleci.com/gh/projecthire/pyrite)

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
