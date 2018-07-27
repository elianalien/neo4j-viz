// cara masukin ke database baru:
// setiap habis "//" dikopi - paste - run di browsernya
// urutannya: 
// 1. project kind
// 2. domain
// 3. stack
// 

// project kind
CREATE (project:Project {kind:'Interactive Installation', domain:['uidesign', 'uxdesign', 'animation', 'multimedia', 'installation','cocreation','designsprint', 'hardware', 'usability','database','devops']})
CREATE (:Project {kind:'Web App', domain:['uidesign', 'uxdesign', 'animation', 'frontend','backend','cocreation','usability','devops', 'cocreation','designsprint','indepth','database','devops']})
CREATE (:Project {kind:'Mobile App', domain:['uidesign', 'uxdesign', 'animation', 'mobile', 'frontend','backend','usability', 'database','devops']})
CREATE (:Project {kind:'Design Research', domain:['cocreation','designsprint','indepth','uxdesign','usability', 'datascience','hardware']})

// domain
CREATE (domain:Domain {name:'multimedia'})
CREATE (:Domain {name:'uidesign'})
CREATE (:Domain {name:'uxdesign'})
CREATE (:Domain {name:'animation'})
CREATE (:Domain {name:'installation'})
CREATE (:Domain {name:'devops'})
CREATE (:Domain {name:'mobile'})
CREATE (:Domain {name:'frontend'})
CREATE (:Domain {name:'backend'})
CREATE (:Domain {name:'database'})
CREATE (:Domain {name:'indepth'})
CREATE (:Domain {name:'cocreation'})
CREATE (:Domain {name:'designsprint'})
CREATE (:Domain {name:'usability'})
CREATE (:Domain {name:'hardware'})
CREATE (:Domain {name:'datascience'})

// stack
CREATE (stack:Stack {name:'laravel', desc:'web framework using php', domain:['backend']})
CREATE (:Stack {name:'unrealengine', desc:'game engine / game editor', domain:['multimedia']})
CREATE (:Stack {name:'unity', desc:'game engine / game editor', domain:['multimedia']})
CREATE (:Stack {name:'node', desc:'web framework using javascript', domain:['backend']})
CREATE (:Stack {name:'usergrid', desc:'BaaS framework', domain:['backend']})
CREATE (:Stack {name:'cassandra', desc:'open-source distributed NoSQL database management system ', domain:['database', 'backend']})
CREATE (:Stack {name:'bootstrap', desc:'open-source front-end library', domain:['frontend']})
CREATE (:Stack {name:'mysql', desc:'open-source relational database management system', domain:['backend', 'database']})
CREATE (:Stack {name:'cesium', desc:'open-source JavaScript library for world-class 3D mapping of geospatial data', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'mapbox', desc:'Mapbox is a large provider of custom online maps for websites and applications', domain:['frontend']})
CREATE (:Stack {name:'touchdesigner', desc:'visual development platform', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'openframeworks', desc:'open source toolkit designed for "creative coding"', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'cinder', desc:'free and open source library for professional-quality creative coding in C++.', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'python', desc:'open source interpreted high-level programming language for general-purpose programming', domain:['frontend', 'multimedia', 'backend']})
CREATE (:Stack {name:'mqtt', desc:'A lightweight messaging protocol for small sensors and mobile devices', domain:['backend', 'multimedia', 'hardware']})
CREATE (:Stack {name:'arduino', desc:'open source computer hardware ', domain:['hardware', 'multimedia']})
CREATE (:Stack {name:'aftereffect', desc:'a digital visual effects, motion graphics, and compositing application ', domain:['frontend', 'multimedia', 'uxdesign', 'uidesign', 'mobile']})
CREATE (:Stack {name:'illustrator', desc:'a vector graphics editor ', domain:['frontend', 'multimedia', 'uxdesign', 'uidesign', 'mobile']})
CREATE (:Stack {name:'premier', desc:'a timeline-based video editing app ', domain:['frontend', 'multimedia', 'uxdesign', 'uidesign', 'mobile']})
CREATE (:Stack {name:'scorm', desc:'a self-contained ZIP file containing certain contents defined by the SCORM standard', domain:['frontend']})
CREATE (:Stack {name:'angular', desc:'TypeScript-based open-source front-end web application platform', domain:['frontend', 'multimedia', 'uidesign']})
CREATE (:Stack {name:'react', desc:'a JavaScript library for building user interfaces.', domain:['frontend', 'multimedia', 'mobile']})
CREATE (:Stack {name:'expressjs', desc:' a web application framework for Node.js', domain:['backend']})
CREATE (:Stack {name:'d3', desc:'a JavaScript library for producing dynamic, interactive data visualizations in web browsers.', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'neo4j', desc:'graph database management system ', domain:['backend', 'database', 'datascience']})
CREATE (:Stack {name:'django', desc:'free and open-source web framework, written in Python', domain:['backend']})
CREATE (:Stack {name:'mongodb', desc:'free and open-source cross-platform document-oriented database program.', domain:['backend', 'database']})
CREATE (:Stack {name:'threejs', desc:'cross-browser JavaScript library and Application Programming Interface used to create and display animated 3D computer graphics', domain:['frontend', 'multimedia', 'datascience']})
CREATE (:Stack {name:'processing', desc:'open-source computer programming language and integrated development environment built for the electronic arts, new media art, and visual design ', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'p5js', desc:'JS client-side library for creating graphic and interactive experiences, based on the core principles of Processing.', domain:['frontend', 'multimedia']})
CREATE (:Stack {name:'dataton', desc:'multi-display software and media server video playback systems', domain:['installation', 'hardware', 'multimedia']})
CREATE (:Stack {name:'resolume', desc:'media server for display and live projection', domain:['installation', 'hardware', 'multimedia']})

// create relation between stack and domain
match (project:Project), (domain:Domain)
where ANY (x IN project.domain WHERE x = domain.name)
create (project)-[c:MIGHT_NEED]->(domain)

// create relation between stack and domain
match (stack:Stack), (domain:Domain)
where ANY (x IN stack.domain WHERE x = domain.name)
create (domain)-[c:TECH_STACK]->(stack)

// load csv model 
// load csv with headers from "file:///stacktable.csv" as obj
// with split(obj.doms,', ') as domain
// unwind stack as domain
// merge (domen:Domen {name: obj.domain})
// merge (steck:Steck {name: obj.stack, doms: obj.doms});


// select node and relation particular to one specific object
match (p:Project {kind:"Interactive Installation"})-[a:MIGHT_NEED]->(d:Domain)-[x:TECH_STACK]->(s:Stack)
return p,d,x,s,a

match (d:Domain {name:"multimedia"})-[x:TECH_STACK]->(s:Stack)
return d,x,s