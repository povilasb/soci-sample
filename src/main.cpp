#include <iostream>
#include <string>
#include <list>
#include <utility>
#include <cstdio>

#include <soci.h>
#include <soci-sqlite3.h>


using namespace std;
using namespace soci;


int
main(void)
{
	string db_name = "test.db";
	remove(db_name.c_str());
	session sql(sqlite3, "dbname=" + db_name);
	sql << "create table if not exists users(id text primary key, "
		"pass text);";

	vector< pair<string, string> > users = {
		pair<string, string>("user1", "pass1"),
		pair<string, string>("user2", "pass2")
	};

	for (auto user : users) {
		sql << "insert or ignore into users values(:user, :pass);",
			use(user.first), use(user.second);
	}

	unsigned long user_count;
	sql << "select count(*) from users;", into(user_count);

	vector<string> user_names(user_count);
	vector<string> user_passwords(user_count);
	sql << "select * from users;", into(user_names), into(user_passwords);

	cout << "Users(" << user_count << "):" << '\n';
	for (vector<string>::size_type i = 0; i < user_names.size(); i++) {
		cout << user_names[i] << " : " << user_passwords[i] << '\n';
	}

	return 0;
}
