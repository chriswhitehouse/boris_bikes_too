# boris_bikes_too
A small ruby replication of the 'Boris Bike' system.

## Motivation
This is a second go at the challenge. Trying to reinforce prior learning.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/boris_bikes_too.svg?branch=main)](https://travis-ci.com/chriswhitehouse/boris_bikes_too)

## Code Style
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby with Rspec for testing.

## Features
### User Story 1
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.
```
#### Domain Model
|Objects | Messages |
|---|---|
|Person |   |
|Bike |  |
|DockingStation | release_bike |
```
DockingStation <-- release_bike --> a Bike
```
### User Story 2
```
As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```
#### Domain Model
|Objects | Messages |
|---|---|
|Person |   |
|Bike | working?  |
```
Bike <-- working? --> true/false
```

## Code Example
Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Installation
1. Create project folder `$ mkdir boris_bikes_too`
2. Clone or Fork Repository into project folder
3. Bundle gems with `$ bundle`
4. Check all tests are passing with `$ rspec`

## Tests
Describe and show how to run the tests with code examples.

## How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful

## License
A short snippet describing the license (MIT, Apache etc)

MIT © [Yourname]()
