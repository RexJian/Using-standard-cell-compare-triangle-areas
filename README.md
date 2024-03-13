# Using standard cell compare triangle areas

In the lab, I calculate the areas of two triangles using their base and height. Subsequently, the output includes the area and the hypotenuse of the triangle with the larger area. Furthermore, the design utilizes structural-level descriptions rather than behavioral expressions

## Architecure
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
  

### Subtractor
##### If the equation is A subtract B, A's bits are XOR with 0 and B's bits are XOR with 1 initially. Next, both of them need to extend a sign bit. Finally, after adding them together, I can obtain the final result.
<p align="center">
  <img src="https://github.com/RexJian/Using-standard-cell-compare-triangle-areas/blob/main/SubtractorArchitecture.png" width="700" height="200" alt="Subtractor architecture">
  <br> <strong>Fig3. Subtractor architecture</strong>
</p>
