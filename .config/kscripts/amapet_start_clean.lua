print('install and start amapet frontend & backend')
os.execute('tmux send-keys "cd ~/Repos/amapet/frontend && npm run clean && npm i && npm start" C-m')
os.execute('tmux split-window -h;')
os.execute('tmux send-keys "cd ~/Repos/amapet/backend && npm run clean && npm i && npm run start:dev" C-m')
