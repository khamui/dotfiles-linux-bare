print('Stop Confluence')
os.execute('tmux send-keys "sudo /opt/atlassian/confluence/bin/stop-confluence.sh" C-m')
