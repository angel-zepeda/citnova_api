User.create(username: "admin_api", email: "admin@domain.com", password: "admin123",password_confirmation: "admin123", role: 0)
User.create(username: "Innovacion", email: "innovacion@admin.com", password: "innovacit",password_confirmation: "innovacit", role: 0)
User.create(username: "GestionT", email: "talentoh@admin.com", password: "talentocit",password_confirmation: "talentocit", role: 0)
User.create(username: "DifusionD", email: "difusion@admin.com", password: "difusioncit",password_confirmation: "difusioncit", role: 0)
User.create(username: "DesarCyT", email: "desarcyt@admin.com", password: "desarcytcit",password_confirmation: "desarcytcit", role: 0)
User.create(username: "InfrasCyT", email: "infrascyt@admin.com", password: "infracit1",password_confirmation: "infracit1", role: 0)

Area.create(name: "Innovación").update_column(:id, 1)
Area.create(name: "Talento Humano").update_column(:id, 2)
Area.create(name: "Difusión").update_column(:id, 3)
Area.create(name: "Infrastructura").update_column(:id, 4)
Area.create(name: "DesarrolloCyT").update_column(:id, 5)

