actor Main
  new create(env: Env) =>
    let boss = Boss(env)
    boss.start()