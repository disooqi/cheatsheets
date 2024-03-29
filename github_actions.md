- The secrets that you create are available to use in GitHub Actions workflows. **GitHub Actions can only read a secret if you explicitly include the secret in a workflow**.
- With the exception of `GITHUB_TOKEN`, secrets are not passed to the runner when a workflow is triggered from a forked repository.
- Secrets are not automatically passed to reusable workflows. For more information, see "[Reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows#passing-inputs-and-secrets-to-a-reusable-workflow)."
