# Assignment 3 CS220

### Aryan Vora 200204, Dishay Mehta 200341, Tejas R 201050

## Question 1: 1010 Sequence Detector

> 'A3Q1_SequenceDetector.v' is the implementation of a 1010 Sequence Detector.
> <br>
> We have implemented the above as a Mealy Machine. It outputs 1 as 1010 is detected in the sequence and it allows for overlapping too, otherwise it outputs 0.
> <br>
> We are taking input as a continuous stream of 1 bit numbers.
> <br>
> 'A3Q1_SequenceDetector_tb.v' is the testbench with 15 inputs.
> <br>
> 'A3_Q1_CS220_doc.pdf' is the detailed description and documentation of the 1010 Sequence Detector.

## Question 2: 3 Bit Odd Parity Generator

> 'A3Q2_ThreeBitOddParityGenerator.v' is the implementation of a 3 Bit Odd Parity Generator.
> <br>
> We have implemented the above as a Mealy Machine. It outputs 1 if the 3 bits have odd parity and 0 if the 3 bits have even parity.
> <br>
> We are taking input as a continuous stream of 1 bit numbers. And output is generated after reading 3 inputs, ie every 15 unit time.
> <br>
> 'A3Q2_ThreeBitOddParityGenerator_tb.v' is the testbench with 24 inputs with 5 unit time delay.
> <br>
> 'A3_Q2_CS220_doc.pdf' is the detailed description and documentation of  the 3 Bit Odd Parity Generator.
