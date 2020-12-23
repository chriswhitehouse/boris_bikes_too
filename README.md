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

### User Story 3
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```
#### Domain Model
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | dock  |
```
DockingStation <-- dock_bike --> Bike
```

### User Story 4
```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
#### Domain Model
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | bike  |
```
DockingStation <-- bike --> Bike
```

### User Story 5
```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | release_bike  |
```
DockingStation <-- release_bike --> "No bike available"
```

### User Story 6
```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | dock  |
```
DockingStation <-- dock --> "Docking station full"
```

### User Story 7
```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | DEFAULT_CAPACITY  |
```
DockingStation <-- DEAFAULT_CAPACITY --> 20
```

### User Story 8
```
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | new(capacity)  |
```
DockingStation <-- new(capacity) --> DockingStation
```

### User Story 9
```
As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.
```
|Objects | Messages |
|---|---|
|Person |   |
|Bike | bike.report_broken |
```
Bike <-- report_broken --> Bike
```

### User Story 10
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation | release_bike  |
```
DockingStation <-- release_bike --> 'No bike available'
```

### User Story 11
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).
```
|Objects | Messages |
|---|---|
|Person |   |
|DockingStation| dock  |
```
DockingStation <-- bike.report_broken --> Bike
```

### User Story 12
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
```
|Objects | Messages |
|---|---|
|Van| collect_broken_bikes  |
|Garage| fix_broken_bikes |
|Bike|  |
|DockingStation|  |
```
Van <-- take_broken_bikes(docking_station) --> Bike.broken? = true
Garage <-- fix_broken_bikes(van) --> Bike.broken? = false
```

### User Story 13
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
|Objects | Messages |
|---|---|
|Van| deliver_working_bikes  |
|Garage| collect_working_bikes  |
|Bike|  |
|DockingStation|   |
```
Garage <-- collect_working_bikes --> Van
Van <-- deliver_working_bikes --> DockingStation
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
