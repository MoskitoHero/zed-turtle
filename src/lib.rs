use std::env;
use zed_extension_api::{self as zed, LanguageServerId, Result};

const PACKAGE_NAME: &str = "turtle-language-server";
const LSP_COMMAND: &str = "node_modules/.bin/turtle-language-server";

struct TurtleExtension {}

impl zed::Extension for TurtleExtension {
    fn new() -> Self {
        Self {}
    }

    fn language_server_command(
        &mut self,
        language_server_id: &LanguageServerId,
        _: &zed::Worktree,
    ) -> Result<zed::Command> {
        let version = zed::npm_package_latest_version(PACKAGE_NAME)?;
        if zed::npm_package_installed_version(PACKAGE_NAME)?.as_ref() != Some(&version) {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );
            let result = zed::npm_install_package(PACKAGE_NAME, &version);
            match result {
                Ok(_) => {
                    zed::set_language_server_installation_status(
                        language_server_id,
                        &zed::LanguageServerInstallationStatus::None,
                    );
                }
                Err(err) => {
                    zed::set_language_server_installation_status(
                        language_server_id,
                        &zed::LanguageServerInstallationStatus::Failed(err.to_string()),
                    );
                }
            }
        }

        Ok(zed::Command {
            command: zed::node_binary_path()?,
            args: vec![
                env::current_dir()
                    .unwrap()
                    .join(&LSP_COMMAND)
                    .to_string_lossy()
                    .to_string(),
                "--stdio".to_string(),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(TurtleExtension);
