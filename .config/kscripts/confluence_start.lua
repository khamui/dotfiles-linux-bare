print('Start Confluence')
os.execute('tmux send-keys "sudo /opt/atlassian/confluence/bin/start-confluence.sh -fg" C-m')
