function handler(event) {
  const response = event.response;
  const headers = response.headers;

  headers["strict-transport-security"] = { value: "max-age=63072000; includeSubDomains; preload" };
  headers["content-security-policy"] = { value: "default-src 'none'; img-src 'self'; style-src 'self'; script-src 'self'; frame-ancestors 'none';" };
  headers["x-content-type-options"] = { value: "nosniff" };
  headers["cache-control"] = { value: "public, no-transform, max-age=604800" };

  return response;
}
