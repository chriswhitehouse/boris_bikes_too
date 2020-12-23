# boris_bikes_too
A small ruby replication of the 'Boris Bike' system.

## Motivation
This is a second go at the challenge. Trying to reinforce prior learning.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/boris_bikes_too.svg?branch=main)](https://travis-ci.com/chriswhitehouse/boris_bikes_too)

## Code Style
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

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
|Van| take_broken, deliver_broken_bike  |
|Garage| accept_broken  |
|Bike|  |
|DockingStation|  |
```
Van <-- take_broken(Bike)
Van <-- deliver_broken_bike --> Bike
Garage <-- accept_broken(Bike)
```

### User Story 13
```
As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
|Objects | Messages |
|---|---|
|Van| collect_working, distribute_working_bike  |
|Garage| return_working_bike  |
|Bike|  |
|DockingStation|   |
```
Garage <-- return_working_bike --> Bike
Van <-- collect_working(Bike)
Van <-- distribute_working_bike --> Bike
```

## Code Example
The following is the 'Bike Container' module that forms the basis of the DockingStation, Van, and Garage classes.
```ruby
module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add(bike)
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def remove_bike
    raise "#{self.class.name} empty" if empty?
    bikes.pop
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  private

  attr_reader :bikes
end
```

## Installation
1. Create project folder `$ mkdir boris_bikes_too`
2. Clone or Fork Repository into project folder
3. Bundle gems with `$ bundle`
4. Check all tests are passing with `$ rspec`

## Tests
Run `$ rspec` to run all checks.

60 examples, 0 failures. 100% coverage.

Feature Test Coverage:

User Story:
  1. So that I can use a bike,
      I'd like a docking station to release a bike. :white_check_mark:

  2. So that I can use a good bike,
      I'd like to see if a bike is working
      :white_check_mark:
      
  3. So I can return bikes I've hired
    I want to dock my bike at the docking station
  5. So that I am not confused and charged unnecessarily,
    I'd like docking stations not to release bikes when none available.
  6. So that I can control the distribution of bikes,
    I'd like docking stations not to accept more bikes than capacity.
  7. So that I can plan the distribution of bikes,
    I want a docking station to have a default capacity of 20 bikes.
  8. So that busy areas can be served more effectively,
    I want to be able to specify a larger capacity when necessary.
  9. So that I reduce the chance of getting a broken bike in future,
    I'd like to report a bike as broken when I return it.
  10. So that I can manage broken bikes and not disappoint users,
    I'd like docking stations not to release broken bikes.
  11. So that I can manage broken bikes and not disappoint users,
    I'd like docking stations to accept returning bikes (broken or not).
  12. So that I can manage broken bikes and not disappoint users,
    I'd like vans to take broken bikes from docking stations,
    and deliver them to garages to be fixed.
  13. So that I can manage broken bikes and not disappoint users,
    I'd like garages to provide working bikes
    I'd like vans to collect working bikes from garages
    I'd like vans to distribute working bikes to docking stations.


## How to use?
Use IRB. Require each of:

* bike_container.rb
* bike.rb
* docking_station.rb
* garage.rb
* van.rb
