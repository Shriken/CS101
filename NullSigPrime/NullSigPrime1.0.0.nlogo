;;Copyright 2012 Recondite Studios
;;  Zane Sterling and Sebastian Conybeare
;;
;;This file is part of NullSigPrime
;;
;;NullSigPrime is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License
;;as published by the Free Software Foundation, either version 3 of the License, or any later version.
;;
;;NullSigPrime is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
;;of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
;;
;;You should have recieved a copy of the GNU General Public License along with NullSigPrime. If not, see
;;http://www.gnu/org/licenses/


breed [robots robot]
breed [bullets bullet]
breed [energies energy]

globals [
  deaths
  soft-reset-flag
]

bullets-own [
  speed
  owner
]

robots-own  [
  collected
  age
  fuel
  shooter-cooldown
  ;outputs
  r-tread
  l-tread
  shoot?
  ;hidden layer neurons:
  HL-0 ;neuron-input-robot-distance
  HL-1 ;neuron-input-robot-heading
  HL-2 ;neuron-input-food-distance
  HL-3 ;neuron-input-food-heading
  HL-4
  HL-5
  HL-6
  HL-7
  HL-8
  HL-9
  HL-10
  HL-11
  HL-12
  HL-13 ;r-tread
  HL-14 ;l-tread
  HL-15 ;shoot?
  nextHL-0
  nextHL-1
  nextHL-2
  nextHL-3
  nextHL-4
  nextHL-5
  nextHL-6
  nextHL-7
  nextHL-8
  nextHL-9
  nextHL-10
  nextHL-11
  nextHL-12
  nextHL-13
  nextHL-14
  nextHL-15
  ;complete network's links
  CLL-0-1
  CLL-0-2
  CLL-0-3
  CLL-0-4
  CLL-0-5
  CLL-0-6
  CLL-0-7
  CLL-0-8
  CLL-0-9
  CLL-0-10
  CLL-0-11
  CLL-0-12
  CLL-0-13
  CLL-0-14
  CLL-0-15
  CLL-1-0
  CLL-1-2
  CLL-1-3
  CLL-1-4
  CLL-1-5
  CLL-1-6
  CLL-1-7
  CLL-1-8
  CLL-1-9
  CLL-1-10
  CLL-1-11
  CLL-1-12
  CLL-1-13
  CLL-1-14
  CLL-1-15
  CLL-2-0
  CLL-2-1
  CLL-2-3
  CLL-2-4
  CLL-2-5
  CLL-2-6
  CLL-2-7
  CLL-2-8
  CLL-2-9
  CLL-2-10
  CLL-2-11
  CLL-2-12
  CLL-2-13
  CLL-2-14
  CLL-2-15
  CLL-3-0
  CLL-3-1
CLL-3-2
CLL-3-4
CLL-3-5
CLL-3-6
CLL-3-7
CLL-3-8
CLL-3-9
CLL-3-10
CLL-3-11
CLL-3-12
CLL-3-13
CLL-3-14
CLL-3-15
CLL-4-0
CLL-4-1
CLL-4-2
CLL-4-3
CLL-4-5
CLL-4-6
CLL-4-7
CLL-4-8
CLL-4-9
CLL-4-10
CLL-4-11
CLL-4-12
CLL-4-13
CLL-4-14
CLL-4-15
CLL-5-0
CLL-5-1
CLL-5-2
CLL-5-3
CLL-5-4
CLL-5-6
CLL-5-7
CLL-5-8
CLL-5-9
CLL-5-10
CLL-5-11
CLL-5-12
CLL-5-13
CLL-5-14
CLL-5-15
CLL-6-0
CLL-6-1
CLL-6-2
CLL-6-3
CLL-6-4
CLL-6-5
CLL-6-7
CLL-6-8
CLL-6-9
CLL-6-10
CLL-6-11
CLL-6-12
CLL-6-13
CLL-6-14
CLL-6-15
CLL-7-0
CLL-7-1
CLL-7-2
CLL-7-3
CLL-7-4
CLL-7-5
CLL-7-6
CLL-7-8
CLL-7-9
CLL-7-10
CLL-7-11
CLL-7-12
CLL-7-13
CLL-7-14
CLL-7-15
CLL-8-0
CLL-8-1
CLL-8-2
CLL-8-3
CLL-8-4
CLL-8-5
CLL-8-6
CLL-8-7
CLL-8-9
CLL-8-10
CLL-8-11
CLL-8-12
CLL-8-13
CLL-8-14
CLL-8-15
CLL-9-0
CLL-9-1
CLL-9-2
CLL-9-3
CLL-9-4
CLL-9-5
CLL-9-6
CLL-9-7
CLL-9-8
CLL-9-10
CLL-9-11
CLL-9-12
CLL-9-13
CLL-9-14
CLL-9-15
CLL-10-0
CLL-10-1
CLL-10-2
CLL-10-3
CLL-10-4
CLL-10-5
CLL-10-6
CLL-10-7
CLL-10-8
CLL-10-9
CLL-10-11
CLL-10-12
CLL-10-13
CLL-10-14
CLL-10-15
CLL-11-0
CLL-11-1
CLL-11-2
CLL-11-3
CLL-11-4
CLL-11-5
CLL-11-6
CLL-11-7
CLL-11-8
CLL-11-9
CLL-11-10
CLL-11-12
CLL-11-13
CLL-11-14
CLL-11-15
CLL-12-0
CLL-12-1
CLL-12-2
CLL-12-3
CLL-12-4
CLL-12-5
CLL-12-6
CLL-12-7
CLL-12-8
CLL-12-9
CLL-12-10
CLL-12-11
CLL-12-13
CLL-12-14
CLL-12-15
CLL-13-0
CLL-13-1
CLL-13-2
CLL-13-3
CLL-13-4
CLL-13-5
CLL-13-6
CLL-13-7
CLL-13-8
CLL-13-9
CLL-13-10
CLL-13-11
CLL-13-12
CLL-13-14
CLL-13-15
CLL-14-0
CLL-14-1
CLL-14-2
CLL-14-3
CLL-14-4
CLL-14-5
CLL-14-6
CLL-14-7
CLL-14-8
CLL-14-9
CLL-14-10
CLL-14-11
CLL-14-12
CLL-14-13
CLL-14-15
CLL-15-0
CLL-15-1
CLL-15-2
CLL-15-3
CLL-15-4
CLL-15-5
CLL-15-6
CLL-15-7
CLL-15-8
CLL-15-9
CLL-15-10
CLL-15-11
CLL-15-12
CLL-15-13
CLL-15-14
  ;bias weights
  BW-0
  BW-1
  BW-2
  BW-3
  BW-4
  BW-5
  BW-6
  BW-7
  BW-8
  BW-9
  BW-10
  BW-11
  BW-12
  BW-13
  BW-14
  BW-15
]

to setup-complete
  ca
  reset-ticks
  set-default-shape bullets "dot"
  set-default-shape energies "electric outlet"
  set-default-shape robots "tank-robot"
  set soft-reset-flag false
  repeat 16 [
    spawn-energy
  ]
  create-robots number-of-robots
  [
    set fuel 1000
    set shoot? false
    set CLL-0-1 random-normal 0 gene-variation
    set CLL-0-2 random-normal 0 gene-variation
    set CLL-0-3 random-normal 0 gene-variation
    set CLL-0-4 random-normal 0 gene-variation
    set CLL-0-5 random-normal 0 gene-variation
    set CLL-0-6 random-normal 0 gene-variation
    set CLL-0-7 random-normal 0 gene-variation
    set CLL-0-8 random-normal 0 gene-variation
    set CLL-0-9 random-normal 0 gene-variation
    set CLL-0-10 random-normal 0 gene-variation
    set CLL-0-11 random-normal 0 gene-variation
    set CLL-0-12 random-normal 0 gene-variation
    set CLL-0-13 random-normal 0 gene-variation
    set CLL-0-14 random-normal 0 gene-variation
    set CLL-0-15 random-normal 0 gene-variation
    set CLL-1-2 random-normal 0 gene-variation
    set CLL-1-3 random-normal 0 gene-variation
    set CLL-1-4 random-normal 0 gene-variation
    set CLL-1-5 random-normal 0 gene-variation
    set CLL-1-6 random-normal 0 gene-variation
    set CLL-1-7 random-normal 0 gene-variation
    set CLL-1-8 random-normal 0 gene-variation
    set CLL-1-9 random-normal 0 gene-variation
    set CLL-1-10 random-normal 0 gene-variation
    set CLL-1-11 random-normal 0 gene-variation
    set CLL-1-12 random-normal 0 gene-variation
    set CLL-1-13 random-normal 0 gene-variation
    set CLL-1-14 random-normal 0 gene-variation
    set CLL-1-15 random-normal 0 gene-variation
    set CLL-2-3 random-normal 0 gene-variation
    set CLL-2-4 random-normal 0 gene-variation
    set CLL-2-5 random-normal 0 gene-variation
    set CLL-2-6 random-normal 0 gene-variation
    set CLL-2-7 random-normal 0 gene-variation
    set CLL-2-8 random-normal 0 gene-variation
    set CLL-2-9 random-normal 0 gene-variation
    set CLL-2-10 random-normal 0 gene-variation
    set CLL-2-11 random-normal 0 gene-variation
    set CLL-2-12 random-normal 0 gene-variation
    set CLL-2-13 random-normal 0 gene-variation
    set CLL-2-14 random-normal 0 gene-variation
    set CLL-2-15 random-normal 0 gene-variation
    set CLL-3-4 random-normal 0 gene-variation
    set CLL-3-5 random-normal 0 gene-variation
    set CLL-3-6 random-normal 0 gene-variation
    set CLL-3-7 random-normal 0 gene-variation
    set CLL-3-8 random-normal 0 gene-variation
    set CLL-3-9 random-normal 0 gene-variation
    set CLL-3-10 random-normal 0 gene-variation
    set CLL-3-11 random-normal 0 gene-variation
    set CLL-3-12 random-normal 0 gene-variation
    set CLL-3-13 random-normal 0 gene-variation
    set CLL-3-14 random-normal 0 gene-variation
    set CLL-3-15 random-normal 0 gene-variation
    set CLL-4-5 random-normal 0 gene-variation
    set CLL-4-6 random-normal 0 gene-variation
    set CLL-4-7 random-normal 0 gene-variation
    set CLL-4-8 random-normal 0 gene-variation
    set CLL-4-9 random-normal 0 gene-variation
    set CLL-4-10 random-normal 0 gene-variation
    set CLL-4-11 random-normal 0 gene-variation
    set CLL-4-12 random-normal 0 gene-variation
    set CLL-4-13 random-normal 0 gene-variation
    set CLL-4-14 random-normal 0 gene-variation
    set CLL-4-15 random-normal 0 gene-variation
    set CLL-5-6 random-normal 0 gene-variation
    set CLL-5-7 random-normal 0 gene-variation
    set CLL-5-8 random-normal 0 gene-variation
    set CLL-5-9 random-normal 0 gene-variation
    set CLL-5-10 random-normal 0 gene-variation
    set CLL-5-11 random-normal 0 gene-variation
    set CLL-5-12 random-normal 0 gene-variation
    set CLL-5-13 random-normal 0 gene-variation
    set CLL-5-14 random-normal 0 gene-variation
    set CLL-5-15 random-normal 0 gene-variation
    set CLL-6-7 random-normal 0 gene-variation
    set CLL-6-8 random-normal 0 gene-variation
    set CLL-6-9 random-normal 0 gene-variation
    set CLL-6-10 random-normal 0 gene-variation
    set CLL-6-11 random-normal 0 gene-variation
    set CLL-6-12 random-normal 0 gene-variation
    set CLL-6-13 random-normal 0 gene-variation
    set CLL-6-14 random-normal 0 gene-variation
    set CLL-6-15 random-normal 0 gene-variation
    set CLL-7-8 random-normal 0 gene-variation
    set CLL-7-9 random-normal 0 gene-variation
    set CLL-7-10 random-normal 0 gene-variation
    set CLL-7-11 random-normal 0 gene-variation
    set CLL-7-12 random-normal 0 gene-variation
    set CLL-7-13 random-normal 0 gene-variation
    set CLL-7-14 random-normal 0 gene-variation
    set CLL-7-15 random-normal 0 gene-variation
    set CLL-8-9 random-normal 0 gene-variation
    set CLL-8-10 random-normal 0 gene-variation
    set CLL-8-11 random-normal 0 gene-variation
    set CLL-8-12 random-normal 0 gene-variation
    set CLL-8-13 random-normal 0 gene-variation
    set CLL-8-14 random-normal 0 gene-variation
    set CLL-8-15 random-normal 0 gene-variation
    set CLL-9-10 random-normal 0 gene-variation
    set CLL-9-11 random-normal 0 gene-variation
    set CLL-9-12 random-normal 0 gene-variation
    set CLL-9-13 random-normal 0 gene-variation
    set CLL-9-14 random-normal 0 gene-variation
    set CLL-9-15 random-normal 0 gene-variation
    set CLL-10-11 random-normal 0 gene-variation
    set CLL-10-12 random-normal 0 gene-variation
    set CLL-10-13 random-normal 0 gene-variation
    set CLL-10-14 random-normal 0 gene-variation
    set CLL-10-15 random-normal 0 gene-variation
    set CLL-11-12 random-normal 0 gene-variation
    set CLL-11-13 random-normal 0 gene-variation
    set CLL-11-14 random-normal 0 gene-variation
    set CLL-11-15 random-normal 0 gene-variation
    set CLL-12-13 random-normal 0 gene-variation
    set CLL-12-14 random-normal 0 gene-variation
    set CLL-12-15 random-normal 0 gene-variation
    set CLL-13-14 random-normal 0 gene-variation
    set CLL-13-15 random-normal 0 gene-variation
    set CLL-14-15 random-normal 0 gene-variation
    set BW-0 random-normal 0 gene-variation
    set BW-1 random-normal 0 gene-variation
    set BW-2 random-normal 0 gene-variation
    set BW-3 random-normal 0 gene-variation
    set BW-4 random-normal 0 gene-variation
    set BW-5 random-normal 0 gene-variation
    set BW-6 random-normal 0 gene-variation
    set BW-7 random-normal 0 gene-variation
    set BW-8 random-normal 0 gene-variation
    set BW-9 random-normal 0 gene-variation
    set BW-10 random-normal 0 gene-variation
    set BW-11 random-normal 0 gene-variation
    set BW-12 random-normal 0 gene-variation
    set BW-13 random-normal 0 gene-variation
    set BW-14 random-normal 0 gene-variation
    set BW-15 random-normal 0 gene-variation
    setxy random-xcor random-ycor
  ]
end

to update-complete
  ask robots [
    ;the codd from python
    ;set HL-0 neuron-input-distance
    ;set HL-1 neuron-input-angle
    ;set HL-2 neuron-input-color
    set nextHL-0 HL-1 * CLL-0-1 + HL-2 * CLL-0-2 + HL-3 * CLL-0-3 + HL-4 * CLL-0-4 + HL-5 * CLL-0-5 + HL-6 * CLL-0-6 + HL-7 * CLL-0-7 + HL-8 * CLL-0-8 + HL-9 * CLL-0-9 + HL-10 * CLL-0-10 + HL-11 * CLL-0-11 + HL-12 * CLL-0-12 + HL-13 * CLL-0-13 + HL-14 * CLL-0-14 + HL-15 * CLL-0-15 +  BW-0
    set nextHL-1 HL-0 * CLL-1-0 + HL-2 * CLL-1-2 + HL-3 * CLL-1-3 + HL-4 * CLL-1-4 + HL-5 * CLL-1-5 + HL-6 * CLL-1-6 + HL-7 * CLL-1-7 + HL-8 * CLL-1-8 + HL-9 * CLL-1-9 + HL-10 * CLL-1-10 + HL-11 * CLL-1-11 + HL-12 * CLL-1-12 + HL-13 * CLL-1-13 + HL-14 * CLL-1-14 + HL-15 * CLL-1-15 +  BW-1
    set nextHL-2 HL-0 * CLL-2-0 + HL-1 * CLL-2-1 + HL-3 * CLL-2-3 + HL-4 * CLL-2-4 + HL-5 * CLL-2-5 + HL-6 * CLL-2-6 + HL-7 * CLL-2-7 + HL-8 * CLL-2-8 + HL-9 * CLL-2-9 + HL-10 * CLL-2-10 + HL-11 * CLL-2-11 + HL-12 * CLL-2-12 + HL-13 * CLL-2-13 + HL-14 * CLL-2-14 + HL-15 * CLL-2-15 +  BW-2
    set nextHL-3 HL-0 * CLL-3-0 + HL-1 * CLL-3-1 + HL-2 * CLL-3-2 + HL-4 * CLL-3-4 + HL-5 * CLL-3-5 + HL-6 * CLL-3-6 + HL-7 * CLL-3-7 + HL-8 * CLL-3-8 + HL-9 * CLL-3-9 + HL-10 * CLL-3-10 + HL-11 * CLL-3-11 + HL-12 * CLL-3-12 + HL-13 * CLL-3-13 + HL-14 * CLL-3-14 + HL-15 * CLL-3-15 +  BW-3
    set nextHL-4 HL-0 * CLL-4-0 + HL-1 * CLL-4-1 + HL-2 * CLL-4-2 + HL-3 * CLL-4-3 + HL-5 * CLL-4-5 + HL-6 * CLL-4-6 + HL-7 * CLL-4-7 + HL-8 * CLL-4-8 + HL-9 * CLL-4-9 + HL-10 * CLL-4-10 + HL-11 * CLL-4-11 + HL-12 * CLL-4-12 + HL-13 * CLL-4-13 + HL-14 * CLL-4-14 + HL-15 * CLL-4-15 +  BW-4
    set nextHL-5 HL-0 * CLL-5-0 + HL-1 * CLL-5-1 + HL-2 * CLL-5-2 + HL-3 * CLL-5-3 + HL-4 * CLL-5-4 + HL-6 * CLL-5-6 + HL-7 * CLL-5-7 + HL-8 * CLL-5-8 + HL-9 * CLL-5-9 + HL-10 * CLL-5-10 + HL-11 * CLL-5-11 + HL-12 * CLL-5-12 + HL-13 * CLL-5-13 + HL-14 * CLL-5-14 + HL-15 * CLL-5-15 +  BW-5
    set nextHL-6 HL-0 * CLL-6-0 + HL-1 * CLL-6-1 + HL-2 * CLL-6-2 + HL-3 * CLL-6-3 + HL-4 * CLL-6-4 + HL-5 * CLL-6-5 + HL-7 * CLL-6-7 + HL-8 * CLL-6-8 + HL-9 * CLL-6-9 + HL-10 * CLL-6-10 + HL-11 * CLL-6-11 + HL-12 * CLL-6-12 + HL-13 * CLL-6-13 + HL-14 * CLL-6-14 + HL-15 * CLL-6-15 +  BW-6
    set nextHL-7 HL-0 * CLL-7-0 + HL-1 * CLL-7-1 + HL-2 * CLL-7-2 + HL-3 * CLL-7-3 + HL-4 * CLL-7-4 + HL-5 * CLL-7-5 + HL-6 * CLL-7-6 + HL-8 * CLL-7-8 + HL-9 * CLL-7-9 + HL-10 * CLL-7-10 + HL-11 * CLL-7-11 + HL-12 * CLL-7-12 + HL-13 * CLL-7-13 + HL-14 * CLL-7-14 + HL-15 * CLL-7-15 +  BW-7
    set nextHL-8 HL-0 * CLL-8-0 + HL-1 * CLL-8-1 + HL-2 * CLL-8-2 + HL-3 * CLL-8-3 + HL-4 * CLL-8-4 + HL-5 * CLL-8-5 + HL-6 * CLL-8-6 + HL-7 * CLL-8-7 + HL-9 * CLL-8-9 + HL-10 * CLL-8-10 + HL-11 * CLL-8-11 + HL-12 * CLL-8-12 + HL-13 * CLL-8-13 + HL-14 * CLL-8-14 + HL-15 * CLL-8-15 +  BW-8
    set nextHL-9 HL-0 * CLL-9-0 + HL-1 * CLL-9-1 + HL-2 * CLL-9-2 + HL-3 * CLL-9-3 + HL-4 * CLL-9-4 + HL-5 * CLL-9-5 + HL-6 * CLL-9-6 + HL-7 * CLL-9-7 + HL-8 * CLL-9-8 + HL-10 * CLL-9-10 + HL-11 * CLL-9-11 + HL-12 * CLL-9-12 + HL-13 * CLL-9-13 + HL-14 * CLL-9-14 + HL-15 * CLL-9-15 +  BW-9
    set nextHL-10 HL-0 * CLL-10-0 + HL-1 * CLL-10-1 + HL-2 * CLL-10-2 + HL-3 * CLL-10-3 + HL-4 * CLL-10-4 + HL-5 * CLL-10-5 + HL-6 * CLL-10-6 + HL-7 * CLL-10-7 + HL-8 * CLL-10-8 + HL-9 * CLL-10-9 + HL-11 * CLL-10-11 + HL-12 * CLL-10-12 + HL-13 * CLL-10-13 + HL-14 * CLL-10-14 + HL-15 * CLL-10-15 +  BW-10
    set nextHL-11 HL-0 * CLL-11-0 + HL-1 * CLL-11-1 + HL-2 * CLL-11-2 + HL-3 * CLL-11-3 + HL-4 * CLL-11-4 + HL-5 * CLL-11-5 + HL-6 * CLL-11-6 + HL-7 * CLL-11-7 + HL-8 * CLL-11-8 + HL-9 * CLL-11-9 + HL-10 * CLL-11-10 + HL-12 * CLL-11-12 + HL-13 * CLL-11-13 + HL-14 * CLL-11-14 + HL-15 * CLL-11-15 +  BW-11
    set nextHL-12 HL-0 * CLL-12-0 + HL-1 * CLL-12-1 + HL-2 * CLL-12-2 + HL-3 * CLL-12-3 + HL-4 * CLL-12-4 + HL-5 * CLL-12-5 + HL-6 * CLL-12-6 + HL-7 * CLL-12-7 + HL-8 * CLL-12-8 + HL-9 * CLL-12-9 + HL-10 * CLL-12-10 + HL-11 * CLL-12-11 + HL-13 * CLL-12-13 + HL-14 * CLL-12-14 + HL-15 * CLL-12-15 +  BW-12
    set nextHL-13 HL-0 * CLL-13-0 + HL-1 * CLL-13-1 + HL-2 * CLL-13-2 + HL-3 * CLL-13-3 + HL-4 * CLL-13-4 + HL-5 * CLL-13-5 + HL-6 * CLL-13-6 + HL-7 * CLL-13-7 + HL-8 * CLL-13-8 + HL-9 * CLL-13-9 + HL-10 * CLL-13-10 + HL-11 * CLL-13-11 + HL-12 * CLL-13-12 + HL-14 * CLL-13-14 + HL-15 * CLL-13-15 +  BW-13
    set nextHL-14 HL-0 * CLL-14-0 + HL-1 * CLL-14-1 + HL-2 * CLL-14-2 + HL-3 * CLL-14-3 + HL-4 * CLL-14-4 + HL-5 * CLL-14-5 + HL-6 * CLL-14-6 + HL-7 * CLL-14-7 + HL-8 * CLL-14-8 + HL-9 * CLL-14-9 + HL-10 * CLL-14-10 + HL-11 * CLL-14-11 + HL-12 * CLL-14-12 + HL-13 * CLL-14-13 + HL-15 * CLL-14-15 +  BW-14
    set nextHL-15 HL-0 * CLL-15-0 + HL-1 * CLL-15-1 + HL-2 * CLL-15-2 + HL-3 * CLL-15-3 + HL-4 * CLL-15-4 + HL-5 * CLL-15-5 + HL-6 * CLL-15-6 + HL-7 * CLL-15-7 + HL-8 * CLL-15-8 + HL-9 * CLL-15-9 + HL-10 * CLL-15-10 + HL-11 * CLL-15-11 + HL-12 * CLL-15-12 + HL-13 * CLL-15-13 + HL-14 * CLL-15-14 +  BW-15
    set HL-0 sigprime nextHL-0
    set HL-1 sigprime nextHL-1
    set HL-2 sigprime nextHL-2
    set HL-3 sigprime nextHL-3
    set HL-4 sigprime nextHL-4
    set HL-5 sigprime nextHL-5
    set HL-6 sigprime nextHL-6
    set HL-7 sigprime nextHL-7
    set HL-8 sigprime nextHL-8
    set HL-9 sigprime nextHL-9
    set HL-10 sigprime nextHL-10
    set HL-11 sigprime nextHL-11
    set HL-12 sigprime nextHL-12
    set HL-13 sigprime nextHL-13
    set HL-14 sigprime nextHL-14
    set HL-15 sigprime nextHL-15
    set r-tread nextHL-13
    set l-tread nextHL-14
    set shooter-cooldown shooter-cooldown + 1
    set shoot? nextHL-15 > 0
    if any? other robots [
      set nextHL-0 distance-of-neighbor-robot? true
      set nextHL-1 heading-of-neighbor-robot? true
    ]
    if any? energies [
      set nextHL-2 distance-of-neighbor-robot? false
      set nextHL-3 heading-of-neighbor-robot? false
    ]
  ]
end

to-report heading-of-neighbor-robot? [x]
  if distance-of-neighbor-robot? true = 0 [report 0]
  report
  (atan
    (xcor - ([xcor] of min-one-of robots? x [distance myself]))
    (ycor - ([ycor] of min-one-of robots? x [distance myself])))
  - heading
end

to-report distance-of-neighbor-robot? [x]
  if any? other robots [
    report [distance myself] of min-one-of robots? x [distance myself]
  ]
  report 0
end

to-report robots? [x]
  if x [report other robots]
  report energies
end
  
to go
  ifelse soft-reset-flag [
    set soft-reset-flag false
    repeat 4 [
      ask robots [
        spawn-robot
      ]
    ]
    ask robots [
      set fuel 1000
    ]
  ]
  [
    ask robots [
      robot-move
      energize
      if shoot? and shooter-cooldown >= shot-cooldown [
        shoot
      ]
      pu
      starve
      set age age + 1
      if fuel > reproduction-threshold and
      age > reproductive-age [
        spawn-robot
      ]
    ]
    if ticks mod (10 - energy-abundance) = 0 [
      spawn-energy
    ]
    update-complete
    label-robots
    if deaths / (ticks + 1) > 10 ^ reset-threshold [
      setup-complete
    ]
    if count robots = 0 [
      setup-complete
    ]
    if (round (ticks + shot-cooldown / 2)) mod shot-cooldown = 0 [
      cd
    ]
    wait 0.01
    tick
  ]
end
  
to label-robots
  ask robots [set label round fuel]
  ask bullets [ set label ""]
end

to robot-move
  repeat 2 [
    lt r-tread * 5
    rt l-tread * 5
    fd (r-tread + l-tread) / 20
  ]
end

to energize
  let x xcor
  let y ycor
  ask energies [
    if sqrt ((x - xcor) * (x - xcor) + (y - ycor) * (y - ycor)) < 1 [
      ask myself [
        set fuel fuel + 100
        set collected collected + 100
      ]
      die
    ]
  ]
end

to shoot
  let x who
  if fuel > bullet-cost
  [
    hatch-bullets 1 [
      set speed 0.3
      set owner x
      set color red
      pd
      while [any? bullets] [
        fd speed
        ;stamp
        if at-edge? [
          die
        ]
        if collided? [
          collide
        ]
      ]
    ]
  ]
  set fuel fuel - bullet-cost
  set shooter-cooldown 0
end

to starve
  let x (abs r-tread + abs l-tread) + 0.0000000001
  set fuel fuel - (x + 1 / (x + 1)) * speed-cost-coefficient 
  ;set fuel fuel - 10
  if fuel <= 0 [
    ifelse count robots = 1 [
      set soft-reset-flag true
    ] [
      set deaths deaths + 1
      die
    ]
  ]
end

to-report at-edge?
  report (abs xcor + speed * abs dx >= 19) or (abs ycor + speed * abs dy >= 19)
end

to-report collided?
  report any? enemies-hit
end

to-report enemies-hit
  let x xcor
  let y ycor
  report (robots with [who != [owner] of myself]) with [(xcor - x) * (xcor - x) + (ycor - y) * (ycor - y) <= 1]
end

to collide
  let x 0
  ask one-of enemies-hit [
    ifelse count robots = 1 [
      set soft-reset-flag true
    ] [
      ask bullets with [owner = [who] of myself] [
        die
      ]
    ]
  ]
  if any? robots with [who = [owner] of myself] [
    ask robot owner [
      set fuel fuel + x / 4
      set collected collected + x
    ]
  ]
  set deaths deaths + 1
  if any? robots with [who = [who] of myself]
  [
    spawn-robot
  ]
  die
end

to spawn-energy
  create-energies 1 [
    set color yellow
    setxy random-xcor random-ycor
    while [any? robots-here] [
      setxy random-xcor random-ycor
    ]
  ]
end

to spawn-robot
      let x 1
      let child-fuel fuel / 2
      hatch-robots 2 [
        set age 0
        set fuel child-fuel
        set collected 0
        set shooter-cooldown 0
        setxy random-xcor random-ycor
        set color color + (random 21 - 10) / 5
        set BW-0 BW-0 + x * (random-normal 0 gene-variation)
        set BW-1 BW-1 + x * (random-normal 0 gene-variation)
        set BW-2 BW-2 + x * (random-normal 0 gene-variation)
        set BW-3 BW-3 + x * (random-normal 0 gene-variation)
        set BW-4 BW-4 + x * (random-normal 0 gene-variation)
        set BW-5 BW-5 + x * (random-normal 0 gene-variation)
        set BW-6 BW-6 + x * (random-normal 0 gene-variation)
        set BW-7 BW-7 + x * (random-normal 0 gene-variation)
        set BW-8 BW-8 + x * (random-normal 0 gene-variation)
        set BW-9 BW-9 + x * (random-normal 0 gene-variation)
        set BW-10 BW-10 + x * (random-normal 0 gene-variation)
        set BW-11 BW-11 + x * (random-normal 0 gene-variation)
        set BW-12 BW-12 + x * (random-normal 0 gene-variation)
        set BW-13 BW-13 + x * (random-normal 0 gene-variation)
        set BW-14 BW-14 + x * (random-normal 0 gene-variation)
        set BW-15 BW-15 + x * (random-normal 0 gene-variation)
        set CLL-0-1 CLL-0-1 + x * (random-normal 0 gene-variation)
        set CLL-0-2 CLL-0-2 + x * (random-normal 0 gene-variation)
        set CLL-0-3 CLL-0-3 + x * (random-normal 0 gene-variation)
        set CLL-0-4 CLL-0-4 + x * (random-normal 0 gene-variation)
        set CLL-0-5 CLL-0-5 + x * (random-normal 0 gene-variation)
        set CLL-0-6 CLL-0-6 + x * (random-normal 0 gene-variation)
        set CLL-0-7 CLL-0-7 + x * (random-normal 0 gene-variation)
        set CLL-0-8 CLL-0-8 + x * (random-normal 0 gene-variation)
        set CLL-0-9 CLL-0-9 + x * (random-normal 0 gene-variation)
        set CLL-0-10 CLL-0-10 + x * (random-normal 0 gene-variation)
        set CLL-0-11 CLL-0-11 + x * (random-normal 0 gene-variation)
        set CLL-0-12 CLL-0-12 + x * (random-normal 0 gene-variation)
        set CLL-0-13 CLL-0-13 + x * (random-normal 0 gene-variation)
        set CLL-0-14 CLL-0-14 + x * (random-normal 0 gene-variation)
        set CLL-0-15 CLL-0-15 + x * (random-normal 0 gene-variation)
        set CLL-1-0 CLL-1-0 + x * (random-normal 0 gene-variation)
        set CLL-1-2 CLL-1-2 + x * (random-normal 0 gene-variation)
        set CLL-1-3 CLL-1-3 + x * (random-normal 0 gene-variation)
        set CLL-1-4 CLL-1-4 + x * (random-normal 0 gene-variation)
        set CLL-1-5 CLL-1-5 + x * (random-normal 0 gene-variation)
        set CLL-1-6 CLL-1-6 + x * (random-normal 0 gene-variation)
        set CLL-1-7 CLL-1-7 + x * (random-normal 0 gene-variation)
        set CLL-1-8 CLL-1-8 + x * (random-normal 0 gene-variation)
        set CLL-1-9 CLL-1-9 + x * (random-normal 0 gene-variation)
        set CLL-1-10 CLL-1-10 + x * (random-normal 0 gene-variation)
        set CLL-1-11 CLL-1-11 + x * (random-normal 0 gene-variation)
        set CLL-1-12 CLL-1-12 + x * (random-normal 0 gene-variation)
        set CLL-1-13 CLL-1-13 + x * (random-normal 0 gene-variation)
        set CLL-1-14 CLL-1-14 + x * (random-normal 0 gene-variation)
        set CLL-1-15 CLL-1-15 + x * (random-normal 0 gene-variation)
        set CLL-2-0 CLL-2-0 + x * (random-normal 0 gene-variation)
        set CLL-2-1 CLL-2-1 + x * (random-normal 0 gene-variation)
        set CLL-2-3 CLL-2-3 + x * (random-normal 0 gene-variation)
        set CLL-2-4 CLL-2-4 + x * (random-normal 0 gene-variation)
        set CLL-2-5 CLL-2-5 + x * (random-normal 0 gene-variation)
        set CLL-2-6 CLL-2-6 + x * (random-normal 0 gene-variation)
        set CLL-2-7 CLL-2-7 + x * (random-normal 0 gene-variation)
        set CLL-2-8 CLL-2-8 + x * (random-normal 0 gene-variation)
        set CLL-2-9 CLL-2-9 + x * (random-normal 0 gene-variation)
        set CLL-2-10 CLL-2-10 + x * (random-normal 0 gene-variation)
        set CLL-2-11 CLL-2-11 + x * (random-normal 0 gene-variation)
        set CLL-2-12 CLL-2-12 + x * (random-normal 0 gene-variation)
        set CLL-2-13 CLL-2-13 + x * (random-normal 0 gene-variation)
        set CLL-2-14 CLL-2-14 + x * (random-normal 0 gene-variation)
        set CLL-2-15 CLL-2-15 + x * (random-normal 0 gene-variation)
        set CLL-3-0 CLL-3-0 + x * (random-normal 0 gene-variation)
        set CLL-3-1 CLL-3-1 + x * (random-normal 0 gene-variation)
        set CLL-3-2 CLL-3-2 + x * (random-normal 0 gene-variation)
        set CLL-3-4 CLL-3-4 + x * (random-normal 0 gene-variation)
        set CLL-3-5 CLL-3-5 + x * (random-normal 0 gene-variation)
        set CLL-3-6 CLL-3-6 + x * (random-normal 0 gene-variation)
        set CLL-3-7 CLL-3-7 + x * (random-normal 0 gene-variation)
        set CLL-3-8 CLL-3-8 + x * (random-normal 0 gene-variation)
        set CLL-3-9 CLL-3-9 + x * (random-normal 0 gene-variation)
        set CLL-3-10 CLL-3-10 + x * (random-normal 0 gene-variation)
        set CLL-3-11 CLL-3-11 + x * (random-normal 0 gene-variation)
        set CLL-3-12 CLL-3-12 + x * (random-normal 0 gene-variation)
        set CLL-3-13 CLL-3-13 + x * (random-normal 0 gene-variation)
        set CLL-3-14 CLL-3-14 + x * (random-normal 0 gene-variation)
        set CLL-3-15 CLL-3-15 + x * (random-normal 0 gene-variation)
        set CLL-4-0 CLL-4-0 + x * (random-normal 0 gene-variation)
        set CLL-4-1 CLL-4-1 + x * (random-normal 0 gene-variation)
        set CLL-4-2 CLL-4-2 + x * (random-normal 0 gene-variation)
        set CLL-4-3 CLL-4-3 + x * (random-normal 0 gene-variation)
        set CLL-4-5 CLL-4-5 + x * (random-normal 0 gene-variation)
        set CLL-4-6 CLL-4-6 + x * (random-normal 0 gene-variation)
        set CLL-4-7 CLL-4-7 + x * (random-normal 0 gene-variation)
        set CLL-4-8 CLL-4-8 + x * (random-normal 0 gene-variation)
        set CLL-4-9 CLL-4-9 + x * (random-normal 0 gene-variation)
        set CLL-4-10 CLL-4-10 + x * (random-normal 0 gene-variation)
        set CLL-4-11 CLL-4-11 + x * (random-normal 0 gene-variation)
        set CLL-4-12 CLL-4-12 + x * (random-normal 0 gene-variation)
        set CLL-4-13 CLL-4-13 + x * (random-normal 0 gene-variation)
        set CLL-4-14 CLL-4-14 + x * (random-normal 0 gene-variation)
        set CLL-4-15 CLL-4-15 + x * (random-normal 0 gene-variation)
        set CLL-5-0 CLL-5-0 + x * (random-normal 0 gene-variation)
        set CLL-5-1 CLL-5-1 + x * (random-normal 0 gene-variation)
        set CLL-5-2 CLL-5-2 + x * (random-normal 0 gene-variation)
        set CLL-5-3 CLL-5-3 + x * (random-normal 0 gene-variation)
        set CLL-5-4 CLL-5-4 + x * (random-normal 0 gene-variation)
        set CLL-5-6 CLL-5-6 + x * (random-normal 0 gene-variation)
        set CLL-5-7 CLL-5-7 + x * (random-normal 0 gene-variation)
        set CLL-5-8 CLL-5-8 + x * (random-normal 0 gene-variation)
        set CLL-5-9 CLL-5-9 + x * (random-normal 0 gene-variation)
        set CLL-5-10 CLL-5-10 + x * (random-normal 0 gene-variation)
        set CLL-5-11 CLL-5-11 + x * (random-normal 0 gene-variation)
        set CLL-5-12 CLL-5-12 + x * (random-normal 0 gene-variation)
        set CLL-5-13 CLL-5-13 + x * (random-normal 0 gene-variation)
        set CLL-5-14 CLL-5-14 + x * (random-normal 0 gene-variation)
        set CLL-5-15 CLL-5-15 + x * (random-normal 0 gene-variation)
        set CLL-6-0 CLL-6-0 + x * (random-normal 0 gene-variation)
        set CLL-6-1 CLL-6-1 + x * (random-normal 0 gene-variation)
        set CLL-6-2 CLL-6-2 + x * (random-normal 0 gene-variation)
        set CLL-6-3 CLL-6-3 + x * (random-normal 0 gene-variation)
        set CLL-6-4 CLL-6-4 + x * (random-normal 0 gene-variation)
        set CLL-6-5 CLL-6-5 + x * (random-normal 0 gene-variation)
        set CLL-6-7 CLL-6-7 + x * (random-normal 0 gene-variation)
        set CLL-6-8 CLL-6-8 + x * (random-normal 0 gene-variation)
        set CLL-6-9 CLL-6-9 + x * (random-normal 0 gene-variation)
        set CLL-6-10 CLL-6-10 + x * (random-normal 0 gene-variation)
        set CLL-6-11 CLL-6-11 + x * (random-normal 0 gene-variation)
        set CLL-6-12 CLL-6-12 + x * (random-normal 0 gene-variation)
        set CLL-6-13 CLL-6-13 + x * (random-normal 0 gene-variation)
        set CLL-6-14 CLL-6-14 + x * (random-normal 0 gene-variation)
        set CLL-6-15 CLL-6-15 + x * (random-normal 0 gene-variation)
        set CLL-7-0 CLL-7-0 + x * (random-normal 0 gene-variation)
        set CLL-7-1 CLL-7-1 + x * (random-normal 0 gene-variation)
        set CLL-7-2 CLL-7-2 + x * (random-normal 0 gene-variation)
        set CLL-7-3 CLL-7-3 + x * (random-normal 0 gene-variation)
        set CLL-7-4 CLL-7-4 + x * (random-normal 0 gene-variation)
        set CLL-7-5 CLL-7-5 + x * (random-normal 0 gene-variation)
        set CLL-7-6 CLL-7-6 + x * (random-normal 0 gene-variation)
        set CLL-7-8 CLL-7-8 + x * (random-normal 0 gene-variation)
        set CLL-7-9 CLL-7-9 + x * (random-normal 0 gene-variation)
        set CLL-7-10 CLL-7-10 + x * (random-normal 0 gene-variation)
        set CLL-7-11 CLL-7-11 + x * (random-normal 0 gene-variation)
        set CLL-7-12 CLL-7-12 + x * (random-normal 0 gene-variation)
        set CLL-7-13 CLL-7-13 + x * (random-normal 0 gene-variation)
        set CLL-7-14 CLL-7-14 + x * (random-normal 0 gene-variation)
        set CLL-7-15 CLL-7-15 + x * (random-normal 0 gene-variation)
        set CLL-8-0 CLL-8-0 + x * (random-normal 0 gene-variation)
        set CLL-8-1 CLL-8-1 + x * (random-normal 0 gene-variation)
        set CLL-8-2 CLL-8-2 + x * (random-normal 0 gene-variation)
        set CLL-8-3 CLL-8-3 + x * (random-normal 0 gene-variation)
        set CLL-8-4 CLL-8-4 + x * (random-normal 0 gene-variation)
        set CLL-8-5 CLL-8-5 + x * (random-normal 0 gene-variation)
        set CLL-8-6 CLL-8-6 + x * (random-normal 0 gene-variation)
        set CLL-8-7 CLL-8-7 + x * (random-normal 0 gene-variation)
        set CLL-8-9 CLL-8-9 + x * (random-normal 0 gene-variation)
        set CLL-8-10 CLL-8-10 + x * (random-normal 0 gene-variation)
        set CLL-8-11 CLL-8-11 + x * (random-normal 0 gene-variation)
        set CLL-8-12 CLL-8-12 + x * (random-normal 0 gene-variation)
        set CLL-8-13 CLL-8-13 + x * (random-normal 0 gene-variation)
        set CLL-8-14 CLL-8-14 + x * (random-normal 0 gene-variation)
        set CLL-8-15 CLL-8-15 + x * (random-normal 0 gene-variation)
        set CLL-9-0 CLL-9-0 + x * (random-normal 0 gene-variation)
        set CLL-9-1 CLL-9-1 + x * (random-normal 0 gene-variation)
        set CLL-9-2 CLL-9-2 + x * (random-normal 0 gene-variation)
        set CLL-9-3 CLL-9-3 + x * (random-normal 0 gene-variation)
        set CLL-9-4 CLL-9-4 + x * (random-normal 0 gene-variation)
        set CLL-9-5 CLL-9-5 + x * (random-normal 0 gene-variation)
        set CLL-9-6 CLL-9-6 + x * (random-normal 0 gene-variation)
        set CLL-9-7 CLL-9-7 + x * (random-normal 0 gene-variation)
        set CLL-9-8 CLL-9-8 + x * (random-normal 0 gene-variation)
        set CLL-9-10 CLL-9-10 + x * (random-normal 0 gene-variation)
        set CLL-9-11 CLL-9-11 + x * (random-normal 0 gene-variation)
        set CLL-9-12 CLL-9-12 + x * (random-normal 0 gene-variation)
        set CLL-9-13 CLL-9-13 + x * (random-normal 0 gene-variation)
        set CLL-9-14 CLL-9-14 + x * (random-normal 0 gene-variation)
        set CLL-9-15 CLL-9-15 + x * (random-normal 0 gene-variation)
        set CLL-10-0 CLL-10-0 + x * (random-normal 0 gene-variation)
        set CLL-10-1 CLL-10-1 + x * (random-normal 0 gene-variation)
        set CLL-10-2 CLL-10-2 + x * (random-normal 0 gene-variation)
        set CLL-10-3 CLL-10-3 + x * (random-normal 0 gene-variation)
        set CLL-10-4 CLL-10-4 + x * (random-normal 0 gene-variation)
        set CLL-10-5 CLL-10-5 + x * (random-normal 0 gene-variation)
        set CLL-10-6 CLL-10-6 + x * (random-normal 0 gene-variation)
        set CLL-10-7 CLL-10-7 + x * (random-normal 0 gene-variation)
        set CLL-10-8 CLL-10-8 + x * (random-normal 0 gene-variation)
        set CLL-10-9 CLL-10-9 + x * (random-normal 0 gene-variation)
        set CLL-10-11 CLL-10-11 + x * (random-normal 0 gene-variation)
        set CLL-10-12 CLL-10-12 + x * (random-normal 0 gene-variation)
        set CLL-10-13 CLL-10-13 + x * (random-normal 0 gene-variation)
        set CLL-10-14 CLL-10-14 + x * (random-normal 0 gene-variation)
        set CLL-10-15 CLL-10-15 + x * (random-normal 0 gene-variation)
        set CLL-11-0 CLL-11-0 + x * (random-normal 0 gene-variation)
        set CLL-11-1 CLL-11-1 + x * (random-normal 0 gene-variation)
        set CLL-11-2 CLL-11-2 + x * (random-normal 0 gene-variation)
        set CLL-11-3 CLL-11-3 + x * (random-normal 0 gene-variation)
        set CLL-11-4 CLL-11-4 + x * (random-normal 0 gene-variation)
        set CLL-11-5 CLL-11-5 + x * (random-normal 0 gene-variation)
        set CLL-11-6 CLL-11-6 + x * (random-normal 0 gene-variation)
        set CLL-11-7 CLL-11-7 + x * (random-normal 0 gene-variation)
        set CLL-11-8 CLL-11-8 + x * (random-normal 0 gene-variation)
        set CLL-11-9 CLL-11-9 + x * (random-normal 0 gene-variation)
        set CLL-11-10 CLL-11-10 + x * (random-normal 0 gene-variation)
        set CLL-11-12 CLL-11-12 + x * (random-normal 0 gene-variation)
        set CLL-11-13 CLL-11-13 + x * (random-normal 0 gene-variation)
        set CLL-11-14 CLL-11-14 + x * (random-normal 0 gene-variation)
        set CLL-11-15 CLL-11-15 + x * (random-normal 0 gene-variation)
        set CLL-12-0 CLL-12-0 + x * (random-normal 0 gene-variation)
        set CLL-12-1 CLL-12-1 + x * (random-normal 0 gene-variation)
        set CLL-12-2 CLL-12-2 + x * (random-normal 0 gene-variation)
        set CLL-12-3 CLL-12-3 + x * (random-normal 0 gene-variation)
        set CLL-12-4 CLL-12-4 + x * (random-normal 0 gene-variation)
        set CLL-12-5 CLL-12-5 + x * (random-normal 0 gene-variation)
        set CLL-12-6 CLL-12-6 + x * (random-normal 0 gene-variation)
        set CLL-12-7 CLL-12-7 + x * (random-normal 0 gene-variation)
        set CLL-12-8 CLL-12-8 + x * (random-normal 0 gene-variation)
        set CLL-12-9 CLL-12-9 + x * (random-normal 0 gene-variation)
        set CLL-12-10 CLL-12-10 + x * (random-normal 0 gene-variation)
        set CLL-12-11 CLL-12-11 + x * (random-normal 0 gene-variation)
        set CLL-12-13 CLL-12-13 + x * (random-normal 0 gene-variation)
        set CLL-12-14 CLL-12-14 + x * (random-normal 0 gene-variation)
        set CLL-12-15 CLL-12-15 + x * (random-normal 0 gene-variation)
        set CLL-13-0 CLL-13-0 + x * (random-normal 0 gene-variation)
        set CLL-13-1 CLL-13-1 + x * (random-normal 0 gene-variation)
        set CLL-13-2 CLL-13-2 + x * (random-normal 0 gene-variation)
        set CLL-13-3 CLL-13-3 + x * (random-normal 0 gene-variation)
        set CLL-13-4 CLL-13-4 + x * (random-normal 0 gene-variation)
        set CLL-13-5 CLL-13-5 + x * (random-normal 0 gene-variation)
        set CLL-13-6 CLL-13-6 + x * (random-normal 0 gene-variation)
        set CLL-13-7 CLL-13-7 + x * (random-normal 0 gene-variation)
        set CLL-13-8 CLL-13-8 + x * (random-normal 0 gene-variation)
        set CLL-13-9 CLL-13-9 + x * (random-normal 0 gene-variation)
        set CLL-13-10 CLL-13-10 + x * (random-normal 0 gene-variation)
        set CLL-13-11 CLL-13-11 + x * (random-normal 0 gene-variation)
        set CLL-13-12 CLL-13-12 + x * (random-normal 0 gene-variation)
        set CLL-13-14 CLL-13-14 + x * (random-normal 0 gene-variation)
        set CLL-13-15 CLL-13-15 + x * (random-normal 0 gene-variation)
        set CLL-14-0 CLL-14-0 + x * (random-normal 0 gene-variation)
        set CLL-14-1 CLL-14-1 + x * (random-normal 0 gene-variation)
        set CLL-14-2 CLL-14-2 + x * (random-normal 0 gene-variation)
        set CLL-14-3 CLL-14-3 + x * (random-normal 0 gene-variation)
        set CLL-14-4 CLL-14-4 + x * (random-normal 0 gene-variation)
        set CLL-14-5 CLL-14-5 + x * (random-normal 0 gene-variation)
        set CLL-14-6 CLL-14-6 + x * (random-normal 0 gene-variation)
        set CLL-14-7 CLL-14-7 + x * (random-normal 0 gene-variation)
        set CLL-14-8 CLL-14-8 + x * (random-normal 0 gene-variation)
        set CLL-14-9 CLL-14-9 + x * (random-normal 0 gene-variation)
        set CLL-14-10 CLL-14-10 + x * (random-normal 0 gene-variation)
        set CLL-14-11 CLL-14-11 + x * (random-normal 0 gene-variation)
        set CLL-14-12 CLL-14-12 + x * (random-normal 0 gene-variation)
        set CLL-14-13 CLL-14-13 + x * (random-normal 0 gene-variation)
        set CLL-14-15 CLL-14-15 + x * (random-normal 0 gene-variation)
        set CLL-15-0 CLL-15-0 + x * (random-normal 0 gene-variation)
        set CLL-15-1 CLL-15-1 + x * (random-normal 0 gene-variation)
        set CLL-15-2 CLL-15-2 + x * (random-normal 0 gene-variation)
        set CLL-15-3 CLL-15-3 + x * (random-normal 0 gene-variation)
        set CLL-15-4 CLL-15-4 + x * (random-normal 0 gene-variation)
        set CLL-15-5 CLL-15-5 + x * (random-normal 0 gene-variation)
        set CLL-15-6 CLL-15-6 + x * (random-normal 0 gene-variation)
        set CLL-15-7 CLL-15-7 + x * (random-normal 0 gene-variation)
        set CLL-15-8 CLL-15-8 + x * (random-normal 0 gene-variation)
        set CLL-15-9 CLL-15-9 + x * (random-normal 0 gene-variation)
        set CLL-15-10 CLL-15-10 + x * (random-normal 0 gene-variation)
        set CLL-15-11 CLL-15-11 + x * (random-normal 0 gene-variation)
        set CLL-15-12 CLL-15-12 + x * (random-normal 0 gene-variation)
        set CLL-15-13 CLL-15-13 + x * (random-normal 0 gene-variation)
        set CLL-15-14 CLL-15-14 + x * (random-normal 0 gene-variation)
        set x x * -1
      ]
      die
end

to-report sigprime [x]
  report random-normal ((2 / (1 + e ^ x)) - 1) .05
end
@#$#@#$#@
GRAPHICS-WINDOW
325
23
803
522
19
19
12.0
1
10
1
1
1
0
1
1
1
-19
19
-19
19
1
1
1
ticks
30.0

BUTTON
36
48
99
81
setup
setup-complete
NIL
1
T
OBSERVER
NIL
T
NIL
NIL
1

BUTTON
36
81
99
114
NIL
go
T
1
T
OBSERVER
NIL
G
NIL
NIL
1

SLIDER
815
62
981
95
number-of-robots
number-of-robots
2
40
8
1
1
NIL
HORIZONTAL

MONITOR
1006
265
1102
310
average speed
mean [r-tread + l-tread] of robots
1
1
11

SLIDER
815
161
981
194
gene-variation
gene-variation
0.1
10
0.5
0.1
1
NIL
HORIZONTAL

MONITOR
1107
212
1157
257
NIL
deaths
17
1
11

MONITOR
1007
211
1090
256
average fuel
round mean [ fuel ] of robots
17
1
11

SLIDER
815
29
1007
62
speed-cost-coefficient
speed-cost-coefficient
0
10
0.9605
.0001
1
NIL
HORIZONTAL

MONITOR
1005
160
1131
205
average movement cost
round mean [abs r-tread + abs l-tread] of robots
17
1
11

SLIDER
815
194
981
227
bullet-cost
bullet-cost
0
100
100
1
1
NIL
HORIZONTAL

SLIDER
815
128
981
161
shot-cooldown
shot-cooldown
1
100
1
1
1
NIL
HORIZONTAL

SLIDER
815
95
981
128
reset-threshold
reset-threshold
-2
2
2
.01
1
NIL
HORIZONTAL

MONITOR
1114
264
1171
309
Robots
count robots
0
1
11

SLIDER
820
303
991
336
reproduction-threshold
reproduction-threshold
0
2000
2000
1
1
NIL
HORIZONTAL

SLIDER
818
345
990
378
reproductive-age
reproductive-age
0
500
121
1
1
NIL
HORIZONTAL

SLIDER
818
385
990
418
energy-abundance
energy-abundance
0
9
9
1
1
NIL
HORIZONTAL

BUTTON
36
144
99
177
Save
export-world user-new-file
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
36
113
99
146
Load
import-world user-file
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
28
203
134
231
All save files should be ended with \".csv\"
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

This is a model that simulates an environment in which abstract robots compete against one another by attempting to gather energy and disable one another for fuel with the
hopes of gathering enough energy to be able to reproduce and pass on their genes.

The point of this 'game' is to see the process and result of evolution in a purer environment than could reasonably be achieved in the physical world.

## HOW IT WORKS

Each robot  is controlled by a 9 point complete graph neural network, much like an overly simplified brain, that does not learn within one lifespan, but evolves its behavior over many generations.
They all take four inputs, the distance and angle to the nearest other robot, and the distance and angle to the nearest food object. There are three outputs: the speeds of the right and left treads, respectively, and a boolean value telling the robot whether or not to "fire its lazor".

## HOW TO USE IT

This is a zero player game, meaning that it does not require any user input after determining the initial state. Just position the sliders for the setup you want, press setup, and then go!

The robots will drive about collecting power from the yellow outlets, which is used to power both their drivetrain and cannon, as well as allowing them to reproduce above a certain power threshold.

## THINGS TO TRY

Change the bullet cost to see how this affects the robots' preference between hunting and gathering.  
See if you can find a gene-variation value that gives the best mix between preservation of positive traits and mutation of negative ones.

## INTERESTING THINGS

The simulation says a few intriguing things about evolution and the optimal strategy. For one, note that the robots nearly always end up flitting over the playing field like locusts. This behavior was initially discouraged, but despite our best efforts to create a more interesting battleground, locust-like behavior appears to be optimal on an individual scale.

The neural networks required such large volumes of repetative code that significant portions of the model's code were generated in python.

If you watch carefully you may note that new robots that spawn share a similar color with their parent.

## KNOWN BUGS AND LIMITATIONS

It may take an enormous number of environmental resets for the turtles to start doing anything interesting, because of the magnitude of the number of gene variations.

## RELATED MODELS

Perceptron (models library)  
Wolf-Sheep Predation (models library)  
Robby the Robot (http://web.cecs.pdx.edu/~mm/RobbyTheRobot/)

## CREDITS AND REFERENCES

Boyuan Zhang, for helping test for bugs.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

electric outlet
false
0
Rectangle -7500403 true true 45 0 255 297
Polygon -16777216 false false 120 270 90 240 90 195 120 165 180 165 210 195 210 240 180 270
Rectangle -16777216 true false 169 199 177 236
Rectangle -16777216 true false 169 64 177 101
Polygon -16777216 false false 120 30 90 60 90 105 120 135 180 135 210 105 210 60 180 30
Rectangle -16777216 true false 123 64 131 101
Rectangle -16777216 true false 123 199 131 236
Rectangle -16777216 false false 45 0 255 296

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

tank-robot
true
0
Rectangle -7500403 true true 90 75 210 240
Line -7500403 true 90 150 75 150
Line -7500403 true 210 150 225 150
Rectangle -7500403 true true 45 45 75 270
Rectangle -7500403 true true 225 45 255 270
Rectangle -16777216 true false 135 120 165 165
Rectangle -16777216 true false 120 165 180 180

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
