## Fetch Data

```js
'use client'

// import { type Metadata } from 'next';
import { useState, useEffect } from 'react';
import {getStory} from "@/app/lib/data";
import StoryCard from "@/app/ui/story-card";
import {Story} from "@/app/lib/definitions";

const HEADERS: any = {
    'Authorization': 'Bearer '
}

export default function StoryPage({ params }: { params: { pk: string } }) {
    const [story, setStory] = useState<any>(null);
    useEffect(() => {
        const fetchStory = async () => {
            const res = await fetch(`https://mojrayat.com/mta3/api/v1/stories/${params.pk}`, {
                // cache: 'force-cache',
                // cache: 'no-store',
                headers: HEADERS
            });
            const data = await res.json();
            setStory(data);
        };
        fetchStory();
    }, [params.pk]);

    return (
        <div>
            {story ? (
                // <p>{story.title}</p>
                <StoryCard story={story}/>
            ) : (
                <p>Loading...</p>
            )}
        </div>
    );
}
```


# How to Serve an Next JS website using GitHub Actions

After developing your website, do the following:

## Static Exports
Next.js enables starting as a static site or Single-Page Application (SPA), then later optionally upgrading to use features that require a server.

When running `next build`, Next.js generates an HTML file per route. By breaking a strict SPA into individual HTML files, Next.js can avoid loading unnecessary JavaScript code on the client-side, reducing the bundle size and enabling faster page loads.

Since Next.js supports this static export, it can be deployed and hosted on any web server that can serve HTML/CSS/JS static assets.
```
Good to know: We recommend using the App Router for enhanced static export support.
```
Create file `next.config.js` in the project root directory with following content
```js
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  output: 'export',
  // basePath: '/ahw.al',
  // Optional: Change links `/me` -> `/me/` and emit `/me.html` -> `/me/index.html`
  // trailingSlash: true,

  // Optional: Prevent automatic `/me` -> `/me/`, instead preserve `href`
  // skipTrailingSlashRedirect: true,

  // Optional: Change the output directory `out` -> `dist`
  // distDir: 'dist',
}

module.exports = nextConfig
```
If you are not using a custom domain you need to enable `basePath` in the file above. You need also to figure out away to provide next js with the path to serve the static files such as images.

## GitHub Actions workflow
Create a GitHub Actions workflow in your project directory as follows:
```yml
# Sample workflow for building and deploying a Next.js site to GitHub Pages
#
# To get started with Next.js see: https://nextjs.org/docs/getting-started
#
name: Deploy Next.js site to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["master"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Detect package manager
        id: detect-package-manager
        run: |
          if [ -f "${{ github.workspace }}/yarn.lock" ]; then
            echo "manager=yarn" >> $GITHUB_OUTPUT
            echo "command=install" >> $GITHUB_OUTPUT
            echo "runner=yarn" >> $GITHUB_OUTPUT
            exit 0
          elif [ -f "${{ github.workspace }}/package.json" ]; then
            echo "manager=npm" >> $GITHUB_OUTPUT
            echo "command=ci" >> $GITHUB_OUTPUT
            echo "runner=npx --no-install" >> $GITHUB_OUTPUT
            exit 0
          else
            echo "Unable to determine package manager"
            exit 1
          fi
      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: "16"
          cache: ${{ steps.detect-package-manager.outputs.manager }}
      - name: Setup Pages
        uses: actions/configure-pages@v3
        with:
          # Automatically inject basePath in your Next.js configuration file and disable
          # server side image optimization (https://nextjs.org/docs/api-reference/next/image#unoptimized).
          #
          # You may remove this line if you want to manage the configuration yourself.
          static_site_generator: next
      - name: Restore cache
        uses: actions/cache@v3
        with:
          path: |
            .next/cache
          # Generate a new cache whenever packages or source files change.
          key: ${{ runner.os }}-nextjs-${{ hashFiles('**/package-lock.json', '**/yarn.lock') }}-${{ hashFiles('**.[jt]s', '**.[jt]sx') }}
          # If source files changed but packages didn't, rebuild from a prior cache.
          restore-keys: |
            ${{ runner.os }}-nextjs-${{ hashFiles('**/package-lock.json', '**/yarn.lock') }}-
      - name: Install dependencies
        run: ${{ steps.detect-package-manager.outputs.manager }} ${{ steps.detect-package-manager.outputs.command }}
      - name: Build with Next.js
        run: ${{ steps.detect-package-manager.outputs.runner }} next build
      - name: Static HTML export with Next.js
        run: ${{ steps.detect-package-manager.outputs.runner }} next export
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./out

  # Deployment job
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

## Push The Project
Make sure that package.js file is in sync with the package-lock.js file using `npm install` and that you are using the same node version as in the workflow. Finally push the project to GitHub.

## Configure GitHub Pages
- Go to `settings > pages` of the repository. Under `Build and deployment` choose _GitHub Actions_ as source. 
- Secondly, under `Custom domain` enter the your domain and save.

## Configure DNS record
Go to the website where you manage DNS records of the custom domain and add an `A` record with domain you entered in the GitHub setting and IP of the website.
