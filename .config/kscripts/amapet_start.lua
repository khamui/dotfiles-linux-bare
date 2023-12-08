print('start amapet frontend & backend')
os.execute('tmux send-keys "cd ~/Repos/amapet/frontend && npm start" C-m')
os.execute('tmux split-window -h;')
os.execute('tmux send-keys "cd ~/Repos/amapet/backend && npm start" C-m')
