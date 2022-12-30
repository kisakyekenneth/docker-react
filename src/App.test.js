import { render, screen } from '@testing-library/react';
import { it } from 'eslint/lib/rule-tester/rule-tester';
import App from './App';

test('renders learn react link', () => {
  render(<App />);
  const linkElement = screen.getByText(/reload/i);
  expect(linkElement).toBeInTheDocument();
});
