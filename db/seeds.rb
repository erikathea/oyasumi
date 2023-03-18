users = User.create([
  {username: 'Bluey', first_name: 'Bluey Christina', last_name: 'Heeler' },
  { username: 'Bingo', first_name: 'Bingo', last_name: 'Heeler' },
  { username: 'Mum', first_name: 'Chili' },
  { username: 'Dad', first_name: 'Bandit' }
])

Follow.create([
  { user_id: users[0].id, followed_user_id: users[1].id },
  { user_id: users[0].id, followed_user_id: users[2].id },
  { user_id: users[0].id, followed_user_id: users[3].id },
  { user_id: users[3].id, followed_user_id: users[0].id },
])

Record.create([
  { user_id: users[0].id,
    clock_in: '2023-03-17 21:10:26',
    clock_out: '2023-03-18 08:20:36',
    remarks: 'Complete sleep' },
  { user_id: users[0].id,
    clock_in: '2023-03-18 22:59:05',
    remarks: 'Forgot to clock out' },
  { user_id: users[0].id,
    clock_in: '2023-03-19 22:09:47' }
])