const { usersDB } = require("../connectionStrings");

module.exports = async (req, res) => {
  try {
    const { user_id, subscription_start_date, subscription_end_date } = req.body;
    await usersDB.query(
      `INSERT INTO user_subscriptions (user_id, subscription_start_date, subscription_end_date) 
       VALUES ($1, $2, $3);`,
      [user_id, subscription_start_date, subscription_end_date]
    );
    res.status(201).send("Subscription created successfully");
  } catch (err) {
    console.error(err);
    res.status(500).send("Error creating subscription");
  }
}