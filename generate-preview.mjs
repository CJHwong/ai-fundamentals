import { chromium } from 'playwright-core';
import { fileURLToPath } from 'url';
import { dirname, resolve } from 'path';

const __dirname = dirname(fileURLToPath(import.meta.url));
const inputPath = resolve(__dirname, 'preview.html');
const outputPath = resolve(__dirname, 'docs', 'preview.png');

const browser = await chromium.launch();
try {
  const page = await browser.newPage();
  await page.setViewportSize({ width: 1200, height: 630 });
  await page.goto(`file://${inputPath}`, { waitUntil: 'load', timeout: 15000 });
  await page.waitForFunction(() => document.fonts.ready);
  await page.screenshot({ path: outputPath, type: 'png' });
} finally {
  await browser.close();
}

console.log(`preview image: ${outputPath}`);
