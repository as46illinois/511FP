# Systolic Array FFT CNN Accelerator

R4_FFT_test: top level, instantiates entire FFT process

FFT_Stage_X: implements X stage of unrolled systolic FFT algorithm

FP_Complex_MULT_64: performs complex multiplication of 64 inputs

R64_Butterfly: computes 16 radix-4 butterflys on 64 inputs

w16_rom: W16 twiddle factors

w64_rom: W64 twiddle factors
