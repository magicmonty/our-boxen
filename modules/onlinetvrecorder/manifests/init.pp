class onlinetvrecorder {
	package { 'OTRDecoderX':
		ensure => installed,
		source => 'http://www.markusweimar.de/static/OTRDecoderX-0.98.dmg',
		provider => appdmg
	}

	package { 'Super OTR':
		ensure => installed,
		source => 'http://apfel-a.macbay.de/wordpress/wp-content/plugins/download-monitor/download.php?id=Super-OTR-0.9.6.0b79.zip',
		provider => compressed_app
	}

	package { 'ViMediaManager':
		ensure => installed,
		source => 'http://dstats.net/download/http://mariusth.heliohost.org/vimediamanager/files/vimediamanager_v0.7a13c.dmg',
		provider => appdmg
	}
}