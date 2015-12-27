# Study Design
Each file was loaded into separate dataframes.
The files was loaded directly without doing any changes.
The following files where loaded:
./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/features.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/y_train.txt
./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/y_test.txt
./UCI HAR Dataset/test/subject_test.txt

# Code Book
Description of the modified data set:
##Activity: 
The activity done written with full text. 
The following values exist:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

##Subject:
The person who did the test.
There are 30 values for subject given in the following format:
Subject 1
Subject 2
Subject 3
.
.
Subject 30

##Measures:
All the measures are calculated as the average value per Acivity and Subject.
This is the only change done compared to the original value of the measure.
The following measures exists:

Time Body Acceleration Mean Value - Direction X                    
Time Body Acceleration Mean Value - Direction Y                   
Time Body Acceleration Mean Value - Direction Z                    
Time Gravity Acceleration Mean Value - Direction X                
Time Gravity Acceleration Mean Value - Direction Y                 
Time Gravity Acceleration Mean Value - Direction Z                
Time Body Acceleration Jerk Mean Value - Direction X               
Time Body Acceleration Jerk Mean Value - Direction Y              
Time Body Acceleration Jerk Mean Value - Direction Z               
Time Body Velocity Mean Value - Direction X                       
Time Body Velocity Mean Value - Direction Y                      
Time Body Velocity Mean Value - Direction Z                       
Time Velocity Jerk Mean Value - Direction X                        
Time Velocity Jerk Mean Value - Direction Y                       
Time Velocity Jerk Mean Value - Direction Z                        
Time Body Acceleration Magnitude Mean Value                       
Time Gravity Acceleration Magnitude Mean Value                     
Time Body Acceleration Jerk Magnitude Mean Value                  
Time Body Velocity Magnitude Mean Value                            
Time Body Velocity Jerk Magnitude Mean Value                      
Frequency Body Acceleration Mean Value - Direction X               
Frequency Body Acceleration Mean Value - Direction Y              
Frequency Body Acceleration Mean Value - Direction Z               
Frequency Body Acceleration Mean Frequency - Direction X          
Frequency Body Acceleration Mean Frequency - Direction Y           
Frequency Body Acceleration Mean Frequency - Direction Z          
Frequency Body Acceleration Jerk Mean Value - Direction X          
Frequency Body Acceleration Jerk Mean Value - Direction Y         
Frequency Body Acceleration Jerk Mean Value - Direction Z          
Frequency Body Acceleration Jerk Mean Frequency - Direction X
Frequency Body Acceleration Jerk Mean Frequency - Direction Y
Frequency Body Acceleration Jerk Mean Frequency - Direction Z     
Frequency Body Velocity Mean Value - Direction X                   
Frequency Body Velocity Mean Value - Direction Y                  
Frequency Body Velocity Mean Value - Direction Z                   
Frequency Body Velocity Mean Frequency - Direction X              
Frequency Body Velocity Mean Frequency - Direction Y
Frequency Body Velocity Mean Frequency - Direction Z
Frequency Body Acceleration Magnitude-Mean Value                 
Frequency Body Acceleration Magnitude-Mean Frequency         
Frequency Body Body Acceleration Jerk Magnitude Mean Value      
Frequency Body Body Acceleration Jerk Magnitude Mean Frequency
Frequency Body Body Velocity Magnitude Mean Value                  
Frequency Body Body Velocity Magnitude Mean Frequency             
Frequency Body Body Velocity Jerk Magnitude Mean Value             
Frequency Body Body Velocity Jerk Magnitude Mean Frequency
Time Body Acceleration Standard Deviation - Direction X         
Time Body Acceleration Standard Deviation - Direction Y           
Time Body Acceleration Standard Deviation - Direction Z          
Time Gravity Acceleration Standard Deviation - Direction X        
Time Gravity Acceleration Standard Deviation - Direction Y         
Time Gravity Acceleration Standard Deviation - Direction Z       
Time Body Acceleration Jerk Standard Deviation - Direction X       
Time Body Acceleration Jerk Standard Deviation - Direction Y      
Time Body Acceleration Jerk Standard Deviation - Direction Z       
Time Body Velocity Standard Deviation - Direction X
Time Body Velocity Standard Deviation - Direction Y
Time Body Velocity Standard Deviation - Direction Z
Time Velocity Jerk Standard Deviation - Direction X
Time Velocity Jerk Standard Deviation - Direction Y
Time Velocity Jerk Standard Deviation - Direction Z
Time Body Acceleration Magnitude Standard Deviation             
Time Gravity Acceleration Magnitude Standard Deviation            
Time Body Acceleration Jerk Magnitude Standard Deviation
Time Body Velocity Magnitude Standard Deviation
Time Body Velocity Jerk Magnitude Standard Deviation
Frequency Body Acceleration Standard Deviation - Direction X
Frequency Body Acceleration Standard Deviation - Direction Y
Frequency Body Acceleration Standard Deviation - Direction Z
Frequency Body Acceleration Jerk Standard Deviation - Direction X 
Frequency Body Acceleration Jerk Standard Deviation - Direction Y
Frequency Body Acceleration Jerk Standard Deviation - Direction Z
Frequency Body Velocity Standard Deviation - Direction X           
Frequency Body Velocity Standard Deviation - Direction Y          
Frequency Body Velocity Standard Deviation - Direction Z           
Frequency Body Acceleration Magnitude-Standard Deviation          
Frequency Body Body Acceleration Jerk Magnitude Standard Deviation
Frequency Body Body Velocity Magnitude Standard Deviation     
Frequency Body Body Velocity Jerk Magnitude Standard Deviation

