module.exports =
	host_url: "http://oauth.us"  # mounted on this url
	base:     "/auth"           # add a base url path. e.g: "/auth"
	base_api: "/api"            # api base path
	port:     3001              # Port to bind
	bind:     "127.0.0.1"       # bind to an ip
	debug:    false             # add stack trace & infos in errors

	###
	ssl:
		key: '/path/to/key'
		certificate: '/path/to/crt'
		ca: '/path/to/ca'
	###

	staticsalt: 'i m a random string, change me.'
	publicsalt: 'i m another random string, change me.'

	# Redis config
	redis:
		port: 6379,
		host: '127.0.0.1',
		# password: '...my redis password...',
		# database: ...0~15...
		# options: {...other options...}

	plugins: [
		'server.statistics',
		'server.admin.auth',
		'server.user_management',
		'server.request',
		'server.admin'
	]