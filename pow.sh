#!/bin/bash
# declare integers
echo "----------------------------------------------------"
echo "Press 1 to Reboot"
echo "Press 2 to Shutdown"
echo "press 3 to Cancel: "
echo "----------------------------------------------------"



read usrin
if [ $usrin -eq "1" ]; then
	echo "Rebooting now..."
	sudo shutdown -r now
else                   

        if [ $usrin -eq 2 ] ; then
				echo "Shuting Down now..."
	sudo shutdown -h now
        else
         
                if [ $usrin -eq 3 ] ; then
                   
               exit
			   else
                        echo "Please make a choice between 1-3 !"

                        choice=4
                fi   
        fi
fi
