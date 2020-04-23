# AVD-Manager-Standalone
Allows users to run their AVDs (Android Virtual Devices) without opening Android Studio

# Bug 23-4-2020
There is a bug in this script which makes it function unexpectedly on machines having only one AVD. We are currently working on this fix, it will be updated soon. Meanwhile, if there are two or more AVD's, this script will work like a charm. If you can help us on this issue, we would be pleased with that.

# Working

This Project uses a simple Powershell Script execute a few commands that run AVD

There are a few things need to be done to get your AVD up and Running

 Find the location of the emulator.exe file. This is usually located in the Android Studio SDK Directory. To find the SDK Directory:

    Open Android Studio
    Click "File"
    Expand "Appearance and Behaviour". Expand "System Settings" on the drop-Down list.
    Click "Android SDK"
    On the top, you can find the Android SDK Directory from the text box of "Android SDK Location". Note that location.

Now execute the Program.

Provide the Location of the emulator.exe file in the Open File Dialog Box.

Re-run the program.
You can now easily launch any AVD by selecting the number.
