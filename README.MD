20OCT20

TA-microsoft-wxtcmd
brodsky@splunk.com

WARNING: The use of this TA to collect Windows Timeline data *will* have privacy implications. Use only with proper approval.

This TA generates and consumes the csv output from Eric Zimmerman's WxTCmd command line tool that parses out the Windows Timeline feature on Windows 10 devices. In order to do this, you need to download Eric's exe and place it in the bin directory of this app. The tool is available here: https://ericzimmerman.github.io/#!index.md

Info about WxTCmd is here: https://binaryforay.blogspot.com/2018/05/introducing-wxtcmd.html

The app installs in the regular app directory on a Splunk Universal Forwarder. You must enable the Windows Timeline feature to use this app successfully. Once you have done that, ensure that your endpoint is collecting Windows Timeline data (Windows key + Tab will bring it up). Then, set the inputs.conf scripted input interval to however often you wish to collect this data. Note - the tool only dumps the entire timeline database, so running this more than once a day is ill advised. You can also adjust the MAX_DAYS_AGO setting in order to restrict the amount of data actually ingest in Splunk to, for example, only the last two days of data. Even with this set, expect duplicates in the data. The timestamping is configured to use LastModifiedTime for each entry. Filtering may also be required to cut down on the amount of data collected!

Also, depending on what browser is used on the endpoint, you may need to add timeline support to it. See https://www.windowscentral.com/microsoft-releases-official-windows-10-timeline-extension-google-chrome for some details.

Finally, the app has a config file named timeline_list.cfg in the bin directory. Edit this and enter a line for each user timeline you want to collect. The format is NAME,PATH where NAME is any user you want to specify (free text field) and PATH is the full path to their ActivitiesCache.db file where timeline data is collected. The TA will run through each config line and generate output for each ActivitiesCache.db in the config file.
