import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow 
{
    visible: true

    width: 600
    height: 500

    //
    minimumWidth: width
    maximumWidth: width
    minimumHeight: height
    maximumHeight: height
    //

    ProgressBar
    {
        id: progressBar

        width: parent.width * 0.9
        y: parent.height - height - 50
        x: parent.width - width - 10

        from: 0 
        to: 100
    }

    Timer
    {
        id: timer
        
        interval: 1000
        running: false
        repeat: true

        onTriggered:
        {
            if(progressBar.value < 100)
            {
                progressBar.value+=1;
            }
        }
    }

    Button
    {
        text: ">"
        width: parent.width * 0.05
        height: parent.height * 0.05

        y: parent.height - height - 15
        x: (progressBar.width / 2)

        onClicked:
        {
            timer.running = false
        }
        

    }

     
    Button
    {
        text: "||"
        width: parent.width * 0.05
        height: parent.height * 0.05

        y: parent.height - height - 15
        x: (progressBar.width / 2) + 30
        
        onClicked:
        {
            timer.running = true
        }

    }

    Button
    {
        text: ">>"
        width: parent.width * 0.05
        height: parent.height * 0.05

        y: parent.height - height - 15
        x: (progressBar.width / 2) + 60
        
        onClicked:
        {
            if(progressBar.value < 100)
            {
                progressBar.value+=1;
            }
        }

    }

    Button
    {
        text: "<<"
        width: parent.width * 0.05
        height: parent.height * 0.05

        y: parent.height - height - 15
        x: (progressBar.width / 2) - 30

        onClicked:
        {
            if(progressBar.value < 100&&progressBar.value > 0)
            {
                progressBar.value-=1;
            }
        }

    }

    Text
    {
        id:text

        y: parent.height - height - 50
        x: parent.width - width - 560

        text: progressBar.value
        font.pixelSize: 18
    }



    
}
