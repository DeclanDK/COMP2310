# 1. COMP2310 Notes

This file contains my notes for the course __COMP2310: Concurrent and Distributed Systems__. It will be periodically updated throughout the term.

- [1. COMP2310 Notes](#1-comp2310-notes)
  - [1.1. Programming Language Refreshers](#11-programming-language-refreshers)
  - [1.2. Concurrency](#12-concurrency)
  - [1.3. Mutual Exclusion](#13-mutual-exclusion)
  - [1.4. Communication & Synchronisation](#14-communication--synchronisation)
    - [1.4.1. Scoping of Tasks](#141-scoping-of-tasks)
    - [1.4.2. Monitors](#142-monitors)
      - [1.4.2.1. Object-orientation and Synchronisation](#1421-object-orientation-and-synchronisation)
      - [1.4.2.2. Criticism of Monitors](#1422-criticism-of-monitors)
    - [1.4.3. Synchronisation by Protected Objects](#143-synchronisation-by-protected-objects)

## 1.1. Programming Language Refreshers

## 1.2. Concurrency

## 1.3. Mutual Exclusion

## 1.4. Communication & Synchronisation

### 1.4.1. Scoping of Tasks

### 1.4.2. Monitors

A monitor is a collection of all operations and data-structures shared in a critical region. The monitor will the formulate all those operations as procedures or functions. Access to those data-structures are prohibited, other than to the monitor-procedures and functions.  

Monitors help assure mutual exclusion.  

Monitors use semaphore-like processes to help control access to data-structures.

#### 1.4.2.1. Object-orientation and Synchronisation

Re-usage concepts of OO Programming do no translate to synchronised classes (e.g. monitors). The parent class of an object might need to be adapted in order to suit the global synchronization scheme.  

You can deadlock a whole system by inheriting new methods and ammending them.  

#### 1.4.2.2. Criticism of Monitors

Mutual exclusion is solved elegantly and safely. However, if a monitor large enough then all criticisms of semaphores will apply to them.

### 1.4.3. Synchronisation by Protected Objects

Combining the encapsulation features of monitors with the coordinated entries of conditional critical regions to __protected objects__.

__Condition synchronization__ is realized in the form of protected procedures combined with boolean predicates (__barriers__) called __entries__ in Ada. These barriers need to be evaulated only on two occasions:

- on creating a protected object.

- on leaving a protected procedure or entry.

Barriers are __NOT__ evauluated while inside a protected object or on leaving a protected __function__.

Additional, essential primitives for concurrent control flows:

- Entry Families
  - 
- Requeue Facility
  -  
- Private Entries
  - 

Eets.
