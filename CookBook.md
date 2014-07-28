Cook book
============


Variable list and descriptions
------------------------------
The feature nomenclature is defined by a set of word/tokens divided by dots. The possible tokens are:

Token name       | Description
-----------------|------------
Time             | Time signal
Fourier          | Fast Fourier Transform (FFT) of the signal
Body     		 | Body acceleration signal
Jerk  			 | Jerk signal
Acc 			 | Signal from the accelerometer
Gyro    		 | Signal from the gyroscope
Gravity      	 | Gravity signal
Mag         	 | Magnitude of the three dimensional signal, in this case that means Euclidean norm
X/Y/Z  		     | Axis of the signal
mean   	         | Mean of the signal
std        		 | Standard deviation of the signal


For example Fourier.Body.Acc.mean.X represents the FFT of the body linear acceleration signal mean along the X axis. 
Moreover, the first two columns "Subject" and "Activity" describe the subject tracked and the activity performed respectively.

Note that the value shown in aggregateData.csv represent the average of the variables described above aggregated by Activity and Subject, that is, in the example Fourier.Body.Acc.mean.X the value shown
in aggregateData.csv represent the average of the FFT of the body linear acceleration signal mean along the X axis. (Yes, there are averages of means and standard deviation)