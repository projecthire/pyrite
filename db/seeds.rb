# candidate roles
Role.create({name: "RegisteredCandidate", description: "A registered candidate can take the test or submit ideas."})
Role.create({name: "ApprovedCandidate", description: "An approved candidate has passed the test and/or submitted a good idea."})
# organization roles
Role.create({name: "PaidOrganization", description: "A full employer can access all employer-facing services."})
Role.create({name: "TrialOrganization", description: "A trial employer can access only some if the employer-facing services."})
# employer roles
Role.create({name: "OrganizationOwner", description: "An organization owner is granted administrative privileges over an organization."})
Role.create({name: "OrganizationMember", description: "An organization owner is granted administrative privileges over an organization."})
# admin roles
Role.create({name: "SuperAdmin", description: "A super-admin is granted any and all privileges."})
Role.create({name: "SupportAdmin", description: "A support admin is granted all privileges except those related to users/roles."})
Role.create({name: "ContentAdmin", description: "A content admin is granted all privileges related to creating, editing and publishing content."})
