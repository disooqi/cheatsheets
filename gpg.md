- [Sign in to Docker Desktop](https://docs.docker.com/desktop/get-started/)
- [pass](https://www.passwordstore.org/)

### Credentials management for Linux users
Docker Desktop relies on [pass](https://www.passwordstore.org/) to store credentials in gpg2-encrypted files. Before signing in to Docker Hub from the Docker Dashboard or the Docker menu, you must initialize 
pass. Docker Desktop displays a warning if you've not initialized pass.

You can initialize pass by using a gpg key. To generate a gpg key, run:
```bash
gpg --generate-key
gpg --full-generate-key
pass init <your_generated_gpg-id_public_key>
```
