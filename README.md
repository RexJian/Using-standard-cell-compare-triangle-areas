# Using standard cell compare triangle areas

In the lab, I calculate the areas of two triangles using their base and height. Subsequently, the output includes the area and the hypotenuse of the triangle with the larger area. Furthermore, the design utilizes structural-level descriptions rather than behavioral expressions

## Table of Content
- [Architecture](#architecture)
- [Circuit Block Design](#circuit-block-design)
  - [Binary Multiplier](#binary-multiplier)
  - [Comparator and Subtractor](#comparator-and-subtractor)
  - [Shift Right](#shift-right)

## Architecture
<p align="center">
  <img src="https://github.com/RexJian/Using-standard-cell-compare-triangle-areas/blob/main/Architecture.png" width="600" height="220" alt="Architecture">
  <br> <strong>Fig1. Architecture</strong>
</p> 

a[8:0] : First triangle base  
b[8:0] : First triangle height  
c[8:0] : First triangle hypotenuse  
d[8:0] : Second triangle base  
e[8:0] : Second triangle height  
f[8:0] : Second triangle hypotenuse  

## Circuit Block Design
  
### Binary Multiplier
##### Use serveral full adders and half adders to compose a 9-bits binary multiplier. The following image is the instance of a 4-bit binary multiplier.
<p align="center">
  <img src="https://github.com/RexJian/Using-standard-cell-compare-triangle-areas/blob/main/Multiplier4Bits_Architecture.png" width="600" height="500" alt="4-bit binary architecture">
  <br> <strong>Fig2. 4-bit binary multiplier architecture</strong>
</p>
  

### Comparator and Subtractor
##### If we wish to compare variables A and B to determine which one is larger, we can examine the sign bit using a subtractor. When we perform the operation A subtract B, we initially XOR A's bits with 0 and B's bits with 1. Then, both variables need to extend a sign bit. Finally, after adding them together, we obtain the final result. If A is greater than B, the sign bit of the result is 0; conversely, if B is greater, it is 1.
<p align="center">
  <img src="https://github.com/RexJian/Using-standard-cell-compare-triangle-areas/blob/main/SubtractorArchitecture.png" width="700" height="200" alt="Subtractor architecture">
  <br> <strong>Fig3. Subtractor architecture</strong>
</p>

### Shift Right
##### To achieve the shifting right effect, use multiple buffers. Like the following diagram.
<p align="center">
  <img src="https://github.com/RexJian/Using-standard-cell-compare-triangle-areas/blob/main/ShiftRightArchitecture.png" width="400" height="500" alt="Shift right architecture">
  <br> <strong>Fig4. Shift right architecture</strong>
</p>
