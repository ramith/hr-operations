import ballerina/http;

type Person record {
    readonly int id;
    string firstName;
    string lastName;
    string country;
    string atsId;
    string designation;
    string onboardingDate;
    string personalEmail;
    string[] skills;

};

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - list of Person
    resource function post onboard(@http:Payload Person person) returns Person|error {

        Person p = {
            id: onboarded.nextKey(),
            firstName: person.firstName,
            lastName: person.lastName,
            country: person.country,
            atsId: person.atsId,
            designation: person.designation,
            onboardingDate: person.onboardingDate,
            personalEmail: person.personalEmail,
            skills: person.skills
        };
        onboarded.put(p);

        // Send a response back to the caller.
        return p;
    }

    # A resource for generating greetings
    # + return - list of Person
    resource function get onboarded() returns Person[]|error {
        // Send a response back to the caller.
        return onboarded.toArray();
    }
}

table<Person> key(id) onboarded = table [
];
