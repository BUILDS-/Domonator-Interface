<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<div class="book" lang="en"><div class="titlepage"><div><div><h1 class="title"><a name="merlin"></a>MySQL Network Monitoring and Advisory Service</h1></div><div><p class="copyright">Copyright © 2005-2007 MySQL AB</p></div><div><div class="legalnotice"><a name="id2464974"></a><p>
        This manual is NOT distributed under a GPL style license. Use of
        the manual is subject to the following terms:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Conversion to other formats is allowed, but the actual
              content may not be altered or edited in any way.
            </p></li><li><p>
              You may create a printed copy for your own personal use.
            </p></li><li><p>
              For all other uses, such as selling printed copies or
              using the manual in whole or in part within another
              publication, prior written agreement from MySQL AB is
              required.
            </p></li></ul></div><p>

        Please email <code class="email">&lt;<a href="mailto:docs@mysql.com">docs@mysql.com</a>&gt;</code> for more information
        or if you are interested in doing a translation.
      </p></div></div><div><div class="abstract"><p class="title"><b>Abstract</b></p><p>
        This manual documents the MySQL Network Monitoring and Advisory Service version 1.2.
      </p><p>
        Document generated on:

2007-07-24

        (revision: 931)
      </p></div></div></div><hr></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="chapter"><a href="#mnmas-introduction">1. Introduction</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-conventions">1.1. Conventions Used in This Document</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-overview">2. An Overview of the Service</a></span></dt><dd><dl><dt><span class="section"><a href="#id2466047">2.1. The Service Architecture</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-service-agent">2.1.1. Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-service-manager">2.1.2. Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-repository">2.1.3. The Repository</a></span></dt><dt><span class="section"><a href="#mnmas-web-client">2.1.4. The Web Client</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-features">2.2. Service Features</a></span></dt><dt><span class="section"><a href="#mnmas-security">2.3. Security</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-install">3. Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-install-introduction">3.1. Introduction</a></span></dt><dd><dl><dt><span class="section"><a href="#system-requirements">3.1.1. Installation Requirements</a></span></dt><dt><span class="section"><a href="#mnmas-user-roles">3.1.2. User Roles</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-install-server">3.2. Service Manager Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-begin-server-install-windows-osx">3.2.1. The Service Manager: Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-server-install-unix">3.2.2. Installing the Service Manager on Unix</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-configuration-settings-advisor-installation">3.3. Configuration Settings and Advisor Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-first-login-dashboard">3.3.1. Initial Dashboard Log-in</a></span></dt><dt><span class="section"><a href="#localization">3.3.2. Setting the Timezone and Locale</a></span></dt><dt><span class="section"><a href="#mnmas-advisor-installation-after-login">3.3.3. Installing Advisors After Initial Log-in</a></span></dt><dt><span class="section"><a href="#mnmas-upgrading-updating-advisors">3.3.4. Upgrading and Updating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-outgoing-email-settings">3.3.5. Outgoing Email Settings</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-install-agent">3.4. Service Agent Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-agent-rights">3.4.1. Creating a MySQL User Account for the Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-windows">3.4.2. Installing the Agent on Microsoft Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-windows">3.4.3. Starting and Stopping the Agent on Windows</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-osx">3.4.4. Starting and Stopping the Agent on Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-unix">3.4.5. Installing the Service Agent on Unix</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-unix">3.4.6. Starting and Stopping the Agent on Unix</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-advanced-agent-configuration">3.5. Advanced Agent Configuration</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-about-mysql-service-agent-ini">3.5.1. The <code class="filename">mysql-service-agent.ini</code> File</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-multi">3.5.2. Monitoring Multiple Servers</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-remote">3.5.3. Configuring an Agent to Monitor a Remote MySQL Server</a></span></dt><dt><span class="section"><a href="#mnmas-ssh-tunnel">3.5.4. Monitoring Outside the Firewall with an SSH Tunnel</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-troubleshooting-agent-start">3.6. Troubleshooting the Agent</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-installation">3.7. Unattended Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-command-line-options-monitoring">3.7.1. Command-Line Options</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-windows">3.7.2. Unattended Windows Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-unix-osx">3.7.3. Unattended Unix and Mac OS X Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-install-starting-services">3.7.4. Starting the Services</a></span></dt></dl></dd><dt><span class="section"><a href="#post-installation">3.8. Post-Installation Considerations</a></span></dt><dt><span class="section"><a href="#mnmas-updating-mysql-network">3.9. Updating The MySQL Network Monitoring and Advisory Service</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-unattended-update">3.9.1. Unattended MySQL Network Monitoring and Advisory Service Update</a></span></dt><dt><span class="section"><a href="#mnmas-reinstalling-mysqlnetwork">3.9.2. Reinstalling MySQL Network Monitoring and Advisory Service</a></span></dt></dl></dd></dl></dd><dt><span class="chapter"><a href="#mnmas-changing-installation">4. Changing Your MySQL Network Monitoring and Advisory Service Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-ungrading-monitored-server">4.1. Upgrading the Monitored MySQL Server</a></span></dt><dt><span class="section"><a href="#mnmas-changing-monitored-server">4.2. Changing the Server That an Agent Monitors</a></span></dt><dt><span class="section"><a href="#mnmas-suspending-agent">4.3. Temporarily Suspending the Agent</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-exploring-monitor">5. Exploring the Monitor Screen</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-monitor-introduction">5.1. Introduction</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-opening-dashboard">5.1.1. Opening the Dashboard</a></span></dt><dt><span class="section"><a href="#mnmas-dashboard-overview">5.1.2. Overview of the Monitor Page</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-server-tree">5.2. The Server Tree</a></span></dt><dt><span class="section"><a href="#mnmas-monitor-page-graphs">5.3. The Server Graphs and Critical Events</a></span></dt><dt><span class="section"><a href="#mnmas-heat-chart">5.4. The Heat Chart</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-configuring-dashboard-settings">6. Configuration Settings</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-global-preferences">6.1. Global Preferences</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-snmp-traps">6.1.1. SNMP Traps</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-user-preferences">6.2. User Preferences</a></span></dt><dt><span class="section"><a href="#mnmas-managing-servers">6.3. Managing Servers</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-server-grouping">6.3.1. Grouping Servers</a></span></dt><dt><span class="section"><a href="#mnmas-deleting-mysql-server">6.3.2. Removing a Server From the Dashboard</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-managing-users">6.4. Managing Users</a></span></dt><dt><span class="section"><a href="#mnmas-notification-groups">6.5. Notification Groups</a></span></dt><dt><span class="section"><a href="#mnmas-logs">6.6. Logs</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-advisors">7. The Service Advisors</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-update-advisors">7.1. Installing and Updating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-scheduling-advisors">7.2. Scheduling Advisors</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-heat-chart-notifications">7.2.1. Heat Chart Notifications</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-editing-built-in-rules">7.3. Editing Built-in Rules</a></span></dt><dt><span class="section"><a href="#mnmas-creating-advisors-and-rules">7.4. Creating Advisors and Rules</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-creating-advisors">7.4.1. Creating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-creating-rules-overview">7.4.2. Overview of Rule Creation</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-variables">7.4.3. Variables</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-thresholds">7.4.4. Thresholds</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-using-strings">7.4.5. Using Strings</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-wiki-format">7.4.6. Wiki Format</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-unscheduling-advisors">7.5. Disabling and Unscheduling Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-advisor-blackouts">7.6. Scriptable Advisor Blackout Periods</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-events">8. Monitoring and Responding to Advisor Events</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-closing-events">8.1. Closing an Event</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-graphs-tab">9. The Graphs Page</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-available-graphs">9.1. Displaying Graphs</a></span></dt><dt><span class="section"><a href="#mnmas-setting-graph-interval">9.2. Setting an Interval</a></span></dt><dt><span class="section"><a href="#mnmas-setting-graph-time-span">9.3. Setting a Time Span</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-replication">10. The Replication Page</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-replication-details">10.1. Replication Page Details</a></span></dt></dl></dd><dt><span class="chapter"><a href="#mnmas-uninstall">11. Uninstalling the MySQL Network Monitoring and Advisory Service</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-windows-removal">11.1. Removing the MySQL Network Monitoring and Advisory Service: Windows</a></span></dt><dd><dl><dt><span class="section"><a href="#id2480640">11.1.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-agent-windows">11.1.2. Removing the Service Agent</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-unix-osx-removal">11.2. Removing the MySQL Network Monitoring and Advisory Service: Unix and Mac OS X</a></span></dt><dd><dl><dt><span class="section"><a href="#id2481066">11.2.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-service-agent-unix-osx">11.2.2. Removing the Service Agent</a></span></dt></dl></dd></dl></dd><dt><span class="appendix"><a href="#mnmas-log-files">A. Files Associated with The MySQL Network Monitoring and Advisory Service</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-server-log-files">A.1. Log Files for the MySQL Network Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-agent-manager-installation-log-files">A.2. Service Agent and Service Manager Installation Log Files</a></span></dt><dt><span class="section"><a href="#mnmas-agent-log-and-pid-files">A.3. Agent Log and PID Files</a></span></dt><dt><span class="section"><a href="#mnmas-mib-file-location">A.4. The Management Information Base (MIB) File</a></span></dt></dl></dd><dt><span class="appendix"><a href="#mnmas-change-history">B. The MySQL Network Monitoring and Advisory Service Change History</a></span></dt><dd><dl><dt><span class="section"><a href="#changes-1.2.x">B.1. Changes in Release 1.2.x</a></span></dt><dd><dl><dt><span class="section"><a href="#release-1.2">B.1.1. Changes in Release 1.2 (Not Yet Released)</a></span></dt></dl></dd></dl></dd></dl></div><div class="list-of-figures"><p><b>List of Figures</b></p><dl><dt>3.1. <a href="#id2467995">Initial Dashboard log-in</a></dt><dt>3.2. <a href="#id2468515">Outgoing email settings</a></dt><dt>3.3. <a href="#id2468888">The repository information screen</a></dt><dt>3.4. <a href="#mnmas-agent-started">Windows services</a></dt><dt>5.1. <a href="#mnmas-server-graphs">The Graphs screen</a></dt><dt>5.2. <a href="#id2475141">The Heat Chart</a></dt><dt>5.3. <a href="#id2475178">The Heat Chart legend</a></dt><dt>6.1. <a href="#mnmas-logs-screen">Logs screen</a></dt><dt>7.1. <a href="#id2477053">Schedule dialog</a></dt><dt>7.2. <a href="#mnmas-edit-advisor">Edit rule screen</a></dt><dt>8.1. <a href="#mnmas-events-screen">Events screen</a></dt></dl></div><div class="list-of-tables"><p><b>List of Tables</b></p><dl><dt>3.1. <a href="#id2466712">Components installed</a></dt><dt>7.1. <a href="#id2478804">Wiki formatting</a></dt><dt>A.1. <a href="#id2481449">Log file locations – Windows</a></dt><dt>A.2. <a href="#id2481532">Log file locations – Unix</a></dt><dt>A.3. <a href="#id2481614">Log file locations – Mac OS X</a></dt><dt>A.4. <a href="#id2481978">MIB file locations</a></dt></dl></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-introduction"></a>Chapter 1. Introduction</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-conventions">1.1. Conventions Used in This Document</a></span></dt></dl></div><p>
    The MySQL Network Monitoring and Advisory Service is part of the MySQL Enterprise set of Enterprise-ready
    services, designed with the enterprise database professional in
    mind. The MySQL Network Monitoring and Advisory Service takes the guesswork out of database performance
    management and supplies powerful automated mechanisms for keeping an
    enterprise-wide deployment of MySQL servers up and running
    efficiently at all times.
  </p><p>
    The MySQL Network Monitoring and Advisory Service serves as an automated assistant for MySQL database
    administrators. This service is designed to help administrators with
    their day to day tasks by monitoring MySQL servers and identifying
    potential problems. These features are designed to save the database
    administrator's time and effort and to ensure that the highest
    levels of performance, reliability, and security are attained for
    any MySQL database environment, regardless of size.
  </p><p>
    An extension of existing MySQL Enterprise services, MySQL Network Monitoring and Advisory Service monitors
    enterprise database environments and provides expert advice on how
    customers can tighten security and optimize the performance and
    uptime of their MySQL powered systems. Running inside the corporate
    firewall, the MySQL Network Monitoring and Advisory Service provides a consolidated framework for
    monitoring key system metrics and enforcing MySQL best practices
    across the entire MySQL database environment.
  </p><p>
    MySQL Network Monitoring and Advisory Service helps administrators:
  </p><div class="itemizedlist"><ul type="disc"><li><p>
        Intelligently stay up to date with releases and bug fixes
      </p></li><li><p>
        Know what's going on with their system
      </p></li><li><p>
        Manage day to day database maintenance tasks
      </p></li><li><p>
        Improve the performance of their system
      </p></li><li><p>
        Manage and prevent crises
      </p></li></ul></div><p>
    MySQL Network Monitoring and Advisory Service, in combination with the MySQL Enterprise, provides a
    valuable service to the full-time database administrator (DBA), and
    a “<span class="quote">virtual DBA</span>” to organizations that do not have a
    full-time DBA of their own.
  </p><p>
    The MySQL Network Monitoring and Advisory Service was designed to tackle the job of managing the
    performance of any number of MySQL database servers, regardless of
    their physical or geographical location. Although MySQL Network Monitoring and Advisory Service can
    easily track just a handful of MySQL servers, the service is
    specifically designed to greatly curtail the time it takes to get a
    handle on the availability and performance levels of many database
    servers at once.
  </p><p>
    The MySQL Network Monitoring and Advisory Service does this by providing an intuitive and easily
    navigated web-based interface — called the Enterprise
    Dashboard — that serves as the portal for viewing an
    enterprise-wide installation of MySQL database servers. MySQL
    professionals can manage all their servers by group or individually
    if need be.
  </p><p>
    The Enterprise Dashboard web interface does not have to be installed
    on individual desktops, but is instead available from a centrally
    located machine that serves as the main location for the Monitoring
    and Advisory service.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-conventions"></a>1.1. Conventions Used in This Document</h2></div></div></div><p>
      This document uses certain typographical conventions:
    </p><a class="indexterm" name="id2465165"></a><a class="indexterm" name="id2465174"></a><div class="itemizedlist"><ul type="disc"><li><p>
          <code class="literal">Text in this style</code> is used for SQL
          statements; database, table, and column names; program
          listings and source code; and environment variables. Example:
          “<span class="quote">To reload the grant tables, use the <code class="literal">FLUSH
          PRIVILEGES</code> statement.</span>”
        </p></li><li><p>
          <strong class="userinput"><code>Text in this style</code></strong> indicates input that
          you type in examples.
        </p></li><li><p>
          <span><strong class="command">Text in this style</strong></span> indicates the names of
          executable programs and scripts, examples being
          <span><strong class="command">mysql</strong></span> (the MySQL command line client
          program) and <span><strong class="command">mysqld</strong></span> (the MySQL server
          executable).
        </p></li><li><p>
          <em class="replaceable"><code>Text in this style</code></em> is used for
          variable input for which you should substitute a value of your
          own choosing.
        </p></li><li><p>
          Filenames and directory names are written like this:
          “<span class="quote">The global <code class="filename">my.cnf</code> file is located
          in the <code class="filename">/etc</code> directory.</span>”
        </p></li><li><p>
          Character sequences are written like this: “<span class="quote">To specify a
          wildcard, use the ‘<code class="literal">%</code>’
          character.</span>”
        </p></li><li><p>
          <span class="emphasis"><em>Text in this style</em></span> is used for emphasis.
        </p></li><li><p>
          <span class="bold"><strong>Text in this style</strong></span> is used in
          table headings and to convey especially strong emphasis.
        </p></li></ul></div><p>
      When commands are shown that are meant to be executed from within
      a particular program, the prompt shown preceding the command
      indicates which command to use. For example,
      <code class="literal">shell&gt;</code> indicates a command that you execute
      from your login shell, and <code class="literal">C:\&gt;</code> indicates a
      statement that you execute from the command line in Windows:
    </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>type a shell command here</code></strong>
C:\&gt; <strong class="userinput"><code>type a command here</code></strong>
</pre><p>
      The “<span class="quote">shell</span>” is your command interpreter. On Unix,
      this is typically a program such as <span><strong class="command">sh</strong></span>,
      <span><strong class="command">csh</strong></span>, or <span><strong class="command">bash</strong></span>. On Windows,
      the equivalent program is <span><strong class="command">command.com</strong></span> or
      <span><strong class="command">cmd.exe</strong></span>, typically run in a console window.
    </p><p>
      When you enter a command or statement shown in an example, do not
      type the prompt shown in the example.
    </p><p>
      Sometimes, what appears on one line in a console window cannot be
      represented in the documentation on a single line. In cases such
      as this the character ‘<code class="literal">»</code>’ is
      used. For example:
    </p><pre class="programlisting">Please specify the directory where the MySQL Network Monitoring »
and Advisory Service will be installed.
</pre><p>
      Where Unix commands are concerned, the continuation character
      ‘<code class="literal">\</code>’ is used. Doing this allows
      commands to be copied and pasted to the command line verbatim. 
      For example:
    </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>/opt/mysql/network/agent/bin/mysql-service-agent -f \
 /opt/mysql/network/agent/etc/mysql-service-agent.ini</code></strong>
</pre><p>
      SQL keywords are not case sensitive and may be written in either
      case. This document uses uppercase.
    </p><p>
      In syntax descriptions, square brackets
      (‘<code class="literal">[</code>’ and
      ‘<code class="literal">]</code>’) indicate optional words or
      clauses. For example, in the following statement, <code class="literal">IF
      EXISTS</code> is optional:
    </p><pre class="programlisting">DROP TABLE [IF EXISTS] <em class="replaceable"><code>tbl_name</code></em>
</pre><p>
      When a syntax element consists of a number of alternatives, the
      alternatives are separated by vertical bars
      (‘<code class="literal">|</code>’). When one member from a set
      of choices <span class="emphasis"><em>may</em></span> be chosen, the alternatives
      are listed within square brackets
      (‘<code class="literal">[</code>’ and
      ‘<code class="literal">]</code>’):
    </p><pre class="programlisting">TRIM([[BOTH | LEADING | TRAILING] [<em class="replaceable"><code>remstr</code></em>] FROM] <em class="replaceable"><code>str</code></em>)
</pre><p>
      When one member from a set of choices <span class="emphasis"><em>must</em></span> be
      chosen, the alternatives are listed within braces
      (‘<code class="literal">{</code>’ and
      ‘<code class="literal">}</code>’):
    </p><pre class="programlisting">{DESCRIBE | DESC} <em class="replaceable"><code>tbl_name</code></em> [<em class="replaceable"><code>col_name</code></em> | <em class="replaceable"><code>wild</code></em>]
</pre><p>
      An ellipsis (<code class="literal">...</code>) indicates the omission of a
      section of a statement, typically to provide a shorter version of
      more complex syntax. For example, <code class="literal">INSERT ...
      SELECT</code> is shorthand for the form of
      <code class="literal">INSERT</code> statement that is followed by a
      <code class="literal">SELECT</code> statement.
    </p><p>
      An ellipsis can also indicate that the preceding syntax element of
      a statement may be repeated. In the following example, multiple
      <em class="replaceable"><code>reset_option</code></em> values may be given, with
      each of those after the first preceded by commas:
    </p><pre class="programlisting">RESET <em class="replaceable"><code>reset_option</code></em> [,<em class="replaceable"><code>reset_option</code></em>] ...
</pre><p>
      Commands for setting shell variables are shown using Bourne shell
      syntax. For example, the sequence to set the <code class="literal">CC</code>
      environment variable and run the <span><strong class="command">configure</strong></span>
      command looks like this in Bourne shell syntax:
    </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>CC=gcc ./configure</code></strong>
</pre><a class="indexterm" name="id2465650"></a><a class="indexterm" name="id2465659"></a><p>
      If you are using <span><strong class="command">csh</strong></span> or
      <span><strong class="command">tcsh</strong></span>, you must issue commands somewhat
      differently:
    </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>setenv CC gcc</code></strong>
shell&gt; <strong class="userinput"><code>./configure</code></strong>
</pre><p>
      Throughout this document the term
      ‘<code class="literal">Unix</code>’ is used to describe any Unix
      or Unix-like operating system. For an up-to-date list of operating
      systems supported by the MySQL Network Monitoring and Advisory Service please see the
      <a href="https://enterprise.mysql.com/" target="_top">MySQL Enterprise web
      site</a>.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-overview"></a>Chapter 2. An Overview of the Service</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#id2466047">2.1. The Service Architecture</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-service-agent">2.1.1. Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-service-manager">2.1.2. Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-repository">2.1.3. The Repository</a></span></dt><dt><span class="section"><a href="#mnmas-web-client">2.1.4. The Web Client</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-features">2.2. Service Features</a></span></dt><dt><span class="section"><a href="#mnmas-security">2.3. Security</a></span></dt></dl></div><p>
        The MySQL Network Monitoring and Advisory Service is a collection of components that work together to
        monitor and help administer your MySQL server installations. This
        service includes server management agents, advisors, and a central
        MySQL Network Service Manager, all working in tandem with the MySQL Enterprise to
        keep your MySQL servers secure and up to date. All of this is
        controlled through the MySQL Network Enterprise Dashboard — a lightweight
        web-based interface that gives you complete control of your MySQL
        servers from any location.
      </p><p>
        This service is made up of three of components; the Service Agent,
        the Service Manager, and the Advisors.
      </p><p>
        The MySQL Network Service Agent is a lightweight application that allows the
        MySQL Network Service Manager to monitor and interact with the MySQL servers. A
        MySQL Network Service Agent keeps track of server health, database inventory,
        and collects and forwards data to the MySQL Network Service Manager for
        historical purposes and for notification.
      </p><p>
        The MySQL Network Service Manager is the heart of MySQL Network Monitoring and Advisory Service. The MySQL Network Service Manager
        constantly monitors the status of all MySQL servers and can report
        server outages to administrators through a variety of methods. In
        addition, the MySQL Network Service Manager hosts the MySQL Network Advisors,
        gathering data on behalf of the MySQL Network Advisors from the
        MySQL Network Service Agents. It then logically evaluates the results looking
        for patterns or thresholds that have been exceeded and provides
        advice on how to correct any problems detected.
      </p><p>
        MySQL Network Advisors are a series of rules that gather information
        from your MySQL servers via the MySQL Network Service Manager and
        MySQL Network Service Agents, analyze that information based on logical
        expressions developed by MySQL AB, and then offer advice when
        necessary. As new rules are introduced to help manage your MySQL
        servers the MySQL Network Advisors may be updated via the
        MySQL Enterprise web site.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="id2466047"></a>2.1. The Service Architecture</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-service-agent">2.1.1. Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-service-manager">2.1.2. Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-repository">2.1.3. The Repository</a></span></dt><dt><span class="section"><a href="#mnmas-web-client">2.1.4. The Web Client</a></span></dt></dl></div><p>
    The MySQL Network Monitoring and Advisory Service is powered by a distributed web-based application that is
    deployed within the confines of the corporate firewall.
  </p><p>     
    Subscribers are kept up to
    date about the latest releases of the MySQL server or issues that
    may affect their specific implementation of MySQL by using the MySQL Enterprise
    Update Service. This same mechanism is used
    to notify MySQL Network Monitoring and Advisory Service users of updates to the application or to the
    MySQL Advisors and Rules. The various components are described
    below.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-service-agent"></a>2.1.1. Service Agent</h3></div></div></div><p>
      Service Agents are the foot soldiers of the MySQL Network Monitoring and Advisory Service; they monitor 
      each MySQL server. Running as a Windows
      service or Unix daemon, the Agent uses a combination of MySQL
      specific commands, SQL queries, and custom scripts to collect and
      report MySQL server or operating system (OS) specific data. The
      Service Agent initiates a “<span class="quote">heartbeat</span>” to the Service
      Manager on a regular basis to ensure specific MySQL server and OS
      level data collections are current.
    </p><p>
      In the overall architecture, the Service Agent is the only
      component of the MySQL Network Monitoring and Advisory Service that establishes or maintains a
      connection with the monitored MySQL Server. As with any MySQL
      client, the Service Agent is authenticated on the monitored MySQL
      server and requires a username and password to establish a
      connection.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-service-manager"></a>2.1.2. Service Manager</h3></div></div></div><p>
      The Service Manager is the heart and soul of the MySQL Network Monitoring and Advisory Service. It is
      built on a collection of Java services hosted on a single Windows
      or Unix server. The Service Manager interacts with all of the
      Service Agents under its domain to collect MySQL server and OS
      level data for each of the monitored MySQL servers.
    </p><p>
      The Service Manager performs many duties including:
    </p><div class="itemizedlist"><ul type="disc"><li><p>
          Autodiscovery of monitored MySQL Servers
        </p></li><li><p>
          Creation and management of Service Agent tasks
        </p></li><li><p>
          Storage of data collections from Service Agents
        </p></li><li><p>
          Monitoring of key MySQL server and OS level metric data
          collections.
        </p></li><li><p>
          Reporting MySQL best practice events and violations.
        </p></li><li><p>
          Providing MySQL expert advice for MySQL best practice
          violations.
        </p></li></ul></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-repository"></a>2.1.3. The Repository</h3></div></div></div><p>
      The Repository is built on MySQL 5.0.<em class="replaceable"><code>x</code></em>
      and is used to store MySQL server and OS level data collections
      for each of the monitored MySQL Servers. This information is used
      by the Service Manager to evaluate and report the health and
      status of the monitored MySQL environment(s).
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-web-client"></a>2.1.4. The Web Client</h3></div></div></div><p>
      The MySQL Enterprise web client provides the graphical user interface
      (GUI) for the MySQL Network Monitoring and Advisory Service. This interface is the primary means of
      monitoring the state of your MySQL servers, identifying rule
      violations and providing advice on how best to address and correct
      any underlying issues.
    </p><p>
      This interface also provides an easy means of configuring
      advisors, adding users, creating notification groups, and
      receiving updates from MySQL Enterprise.
    </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-features"></a>2.2. Service Features</h2></div></div></div><p> 
      The key features of the MySQL Network Monitoring and Advisory Service can be summarized as follows: 
      
    </p><div class="itemizedlist"><ul type="disc"><li><p> Group-level or Server-level management options</p></li><li><p> Enterprise Dashboard for managing all MySQL Servers from a
          consolidated console</p></li><li><p> Monitoring page for “<span class="quote">at a glance</span>” global health
          check of key systems</p></li><li><p> MySQL-provided Advisors and Advisor Rules for enforcing MySQL
          Best Practices</p></li><li><p> Advisor Rule Scheduling for unattended operations</p></li><li><p> Customizable Thresholds and Alerts for identifying Advisor
          Rule violations</p></li><li><p> User-Defined Advisor Rules</p></li><li><p> Event/Alert History browser for researching advisor-specific
          events and annotations</p></li></ul></div><p> These features are presented through the MySQL Network Enterprise Dashboard which is
      made up of six main pages: </p><div class="itemizedlist"><ul type="disc"><li><p> The <code class="literal">Monitor</code> page comprises: </p><div class="itemizedlist"><ul type="circle"><li><p>
              The <code class="literal">Server Tree</code>: Easily navigate
              monitored servers</p></li><li><p>
              The <code class="literal">Graphing</code>: This capability is built in
              so you can quickly assess critical functions such as
              activity, performance metrics, and number of connections</p></li><li><p>
              The <code class="literal">Heat Chart</code>: Color-coded buttons
              provide key operating system and database metrics
            </p></li></ul></div></li><li><p>
          The <code class="literal">Advisors</code> page </p><p> This page shows the advisors that are currently scheduled.
          There are advisors for a variety of topics such as security and
          indexing. Users can add, edit, or create their own advisors.
        </p></li><li><p>
          The <code class="literal">Events</code> page </p><p> This page shows rule violations, indicating the server,
          severity, and time of occurrence. A number of filter options are
          available, allowing various views of events. </p></li><li><p>
          The <code class="literal">Graphs</code> page </p><p> On this page you can view all the available graphs
          and adjust the scale of the graphs,
          for a more or less detailed view as the situation requires.</p></li><li><p>
          The <code class="literal">Replication</code> page
        </p><p>
          On this page track masters and their slaves
          
        </p></li><li><p>
          The <code class="literal">Settings</code> page </p><p> On this page you configure servers, users, email addresses,
          and notification groups. Entering a username and password for
          MySQL Enterprise provides automatic updates. 
        
        </p></li></ul></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-security"></a>2.3. Security</h2></div></div></div><p>
      Using the Apache web server for the user interface allows an
      administrator to configure the web server to meet any security
      regulations. The MySQL Network Monitoring and Advisory Service architecture is designed to be as secure
      as possible, even when monitoring systems outside of the local
      network.
    </p><p>
      Communications between the MySQL Network Service Agent and MySQL Network Service Manager can
      be protected by Secure Socket Layer (SSL) encryption and server and agent can use SSL
      certificates to provide authentication and prevent spoofing.
    </p><p>
      The MySQL Network Service Agent is like a web browser—it is an HTTP client
      application and it initiates all communication with the
      MySQL Network Service Manager. If the server requires action from the agent, it must
      wait until the agent next initiates contact and sends its request in a
      response. This means you do not need to open an inbound port on the
      machine on which the agent is running because it does not listen
      for requests. However, an outbound port must be open for the agent to
      contact the MySQL Network Service Manager.
    </p><p>
      As an additional security feature, each Agent 
      can have a separate Advisory Service login which minimizes
      exposure should any one agent be 
      compromised.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-install"></a>Chapter 3. Installation</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-install-introduction">3.1. Introduction</a></span></dt><dd><dl><dt><span class="section"><a href="#system-requirements">3.1.1. Installation Requirements</a></span></dt><dt><span class="section"><a href="#mnmas-user-roles">3.1.2. User Roles</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-install-server">3.2. Service Manager Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-begin-server-install-windows-osx">3.2.1. The Service Manager: Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-server-install-unix">3.2.2. Installing the Service Manager on Unix</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-configuration-settings-advisor-installation">3.3. Configuration Settings and Advisor Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-first-login-dashboard">3.3.1. Initial Dashboard Log-in</a></span></dt><dt><span class="section"><a href="#localization">3.3.2. Setting the Timezone and Locale</a></span></dt><dt><span class="section"><a href="#mnmas-advisor-installation-after-login">3.3.3. Installing Advisors After Initial Log-in</a></span></dt><dt><span class="section"><a href="#mnmas-upgrading-updating-advisors">3.3.4. Upgrading and Updating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-outgoing-email-settings">3.3.5. Outgoing Email Settings</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-install-agent">3.4. Service Agent Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-agent-rights">3.4.1. Creating a MySQL User Account for the Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-windows">3.4.2. Installing the Agent on Microsoft Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-windows">3.4.3. Starting and Stopping the Agent on Windows</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-osx">3.4.4. Starting and Stopping the Agent on Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-unix">3.4.5. Installing the Service Agent on Unix</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-unix">3.4.6. Starting and Stopping the Agent on Unix</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-advanced-agent-configuration">3.5. Advanced Agent Configuration</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-about-mysql-service-agent-ini">3.5.1. The <code class="filename">mysql-service-agent.ini</code> File</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-multi">3.5.2. Monitoring Multiple Servers</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-remote">3.5.3. Configuring an Agent to Monitor a Remote MySQL Server</a></span></dt><dt><span class="section"><a href="#mnmas-ssh-tunnel">3.5.4. Monitoring Outside the Firewall with an SSH Tunnel</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-troubleshooting-agent-start">3.6. Troubleshooting the Agent</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-installation">3.7. Unattended Installation</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-command-line-options-monitoring">3.7.1. Command-Line Options</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-windows">3.7.2. Unattended Windows Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-unix-osx">3.7.3. Unattended Unix and Mac OS X Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-install-starting-services">3.7.4. Starting the Services</a></span></dt></dl></dd><dt><span class="section"><a href="#post-installation">3.8. Post-Installation Considerations</a></span></dt><dt><span class="section"><a href="#mnmas-updating-mysql-network">3.9. Updating The MySQL Network Monitoring and Advisory Service</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-unattended-update">3.9.1. Unattended MySQL Network Monitoring and Advisory Service Update</a></span></dt><dt><span class="section"><a href="#mnmas-reinstalling-mysqlnetwork">3.9.2. Reinstalling MySQL Network Monitoring and Advisory Service</a></span></dt></dl></dd></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-install-introduction"></a>3.1. Introduction</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#system-requirements">3.1.1. Installation Requirements</a></span></dt><dt><span class="section"><a href="#mnmas-user-roles">3.1.2. User Roles</a></span></dt></dl></div><p>
      This chapter describes the process of installing the MySQL Network Monitoring and Advisory Service on
      all operating systems. A working installation requires the
      installation of a MySQL Network Service Manager, MySQL Network Enterprise Dashboard, the
      MySQL Network Advisors and one or more MySQL Network Service Agents. Simply
      described, the agent inspects the MySQL server it is monitoring,
      reports to the Service Manager, and the results are interpreted by
      the advisors and displayed in the Dashboard for viewing in a web
      browser.
    </p><p>
      One Service Agent is installed for each MySQL server that is being
      monitored. The Service Agent usually runs on the same machine that
      hosts the monitored MySQL server but it may run on any machine
      that has access to both the MySQL Network Service Manager and the
      MySQL Network Enterprise Dashboard. The agent reports its findings to the Service
      Manager and these results are interpreted by Service Advisors and
      displayed in the Dashboard. The end user opens a web browser to
      view the information presented in the Dashboard. The Service
      Manager and Dashboard run on the same machine and both have access
      to a local MySQL server installed as part of the MySQL Network Monitoring and Advisory Service. This
      server is known as the Repository and provides storage for the
      data provided by the agent.
    </p><p>
      Installation is a three step process:
    </p><div class="orderedlist"><ol type="1"><li><p>
          Install and start the Service Manager on the monitoring
          system.
        </p></li><li><p>
          Configure the Service Manager and install the Service
          Advisors.
        </p></li><li><p>
          Install and start the Service Agent to monitor the targeted
          MySQL server.
        </p></li></ol></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="system-requirements"></a>3.1.1. Installation Requirements</h3></div></div></div><p>
        The Service Manager is available for Windows, Mac OS X, and a
        variety of Unix and Unix-like operating systems, and the Service
        Agent is available on an even wider variety of operating
        systems. For an up-to-date list please see the
        <a href="https://enterprise.mysql.com/" target="_top">MySQL Enterprise web
        site</a>.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          On Mac OS X the Service Manager is currently a
          <span class="bold"><strong>beta</strong></span> release and only the
          Intel architecture is supported. However, the Mac OS X agent
          is fully supported.
        </p></div><p>
        To install the MySQL Network Monitoring and Advisory Service on Windows requires approximately 260 MB
        of space and approximately 450 MB on Unix. Disk space usage will
        increase with time since the Repository stores historical data.
      </p><p>
        The minimum RAM and CPU requirements are one GB and two GHz
        respectively. These requirements will, of course, increase with
        the number of servers being monitored.

        
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-user-roles"></a>3.1.2. User Roles</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-existing-users">3.1.2.1. Existing Users</a></span></dt><dt><span class="section"><a href="#mnmas-created-users">3.1.2.2. User Created During Installation</a></span></dt><dt><span class="section"><a href="#mnmas-users-created-first-login">3.1.2.3. Users Created on First Log-in</a></span></dt></dl></div><p>
        Prior to installation you will need to have at hand credentials
        for access to the MySQL server you plan to monitor and also your
        MySQL Enterprise credentials. <span class="emphasis"><em>During</em></span>
        installation and when first logging in, you will set up a
        variety of users with different roles and credentials. This can
        become confusing. This section outlines the various users
        associated with the MySQL Network Monitoring and Advisory Service and gives a brief description of
        their roles.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-existing-users"></a>3.1.2.1. Existing Users</h4></div></div></div><p>
          The <span class="bold"><strong>MySQL Enterprise user</strong></span>
          – These are the credentials you use to log in to the
          MySQL Enterprise web site. You will need them in order to
          acquire the Service Advisor files and receive updates and, if
          necessary, acquire a product key.
        </p><p>
          The <span class="bold"><strong>MySQL user</strong></span> – For
          Service Agents to report the status of a MySQL server they
          must have privileges on that server. To perform all functions
          an agent must have <code class="literal">SHOW DATABASES</code>,
          <code class="literal">REPLICATION CLIENT</code>,
          <code class="literal">SUPER</code>, and <code class="literal">SELECT</code>
          privileges. In short, the Service Agent needs to have read
          access to all data. Details about this account are given in
          <a href="#mnmas-agent-rights" title="3.4.1. Creating a MySQL User Account for the Service Agent">Section 3.4.1, “Creating a MySQL User Account for the Service Agent”</a>. The default name for
          this user is <code class="literal">mysqluser</code>.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-created-users"></a>3.1.2.2. User Created During Installation</h4></div></div></div><p>
          The <span class="bold"><strong>Repository user</strong></span> –
          This user is the only user in the <code class="literal">user</code>
          table in the <code class="literal">mysql</code> database in the bundled
          MySQL server. To avoid confusion with monitored MySQL servers,
          this server is referred to throughout this document as the
          <code class="literal">Repository</code>. The Repository user can log in
          from <code class="literal">localhost</code> using the password specified
          during installation and has all privileges on all databases.
          These credentials are used to create the Repository and its
          tables and to record data in them. During installation the
          default value for the username for this role is
          <code class="literal">service_manager</code>. No default password is
          specified. You can use these credentials to manage the
          Repository from the command line or when using a program such
          as MySQL Administrator.
        </p><p>
          During installation the file
          <code class="filename">configuration_report.txt</code> is created.
          Reference this file for the credentials of the Repository
          Manager. For more information about this file see,
          <a href="#mnmas-configuration-report">Section 3.2.1.2, “Installing the Service Manager”</a>. After the
          MySQL Network Service Manager is installed, look for this file in the
          following directories:

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                Windows – <code class="filename">C:\Program
                Files\MySQL\Network\Monitoring</code>
              </p></li><li><p>
                Unix –
                <code class="filename">/opt/mysql/network/monitoring</code>
              </p></li><li><p>
                Mac OS X –
                <code class="filename">/Applications/mysql/network/monitoring</code>
              </p></li></ul></div><p>
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-users-created-first-login"></a>3.1.2.3. Users Created on First Log-in</h4></div></div></div><p>
          The <span class="bold"><strong>Root user</strong></span> – This
          user is the administrator of the Dashboard. The first time you
          log in to the Dashboard you must log in as this user. There is
          no default user name or password for this user.
        </p><p>
          The <span class="bold"><strong>Agent user</strong></span> – The
          Service Agent needs to report the status of the MySQL server
          it is monitoring. For this reason it needs to log in to the
          Dashboard. There is no default user name or password for this
          user.
        </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            The Service Agent has two roles in the MySQL Network Monitoring and Advisory Service; it must
            have access to the Dashboard and to the MySQL server it is
            monitoring. For a description of the agent as a MySQL user
            see, <a href="#mnmas-existing-users" title="3.1.2.1. Existing Users">Section 3.1.2.1, “Existing Users”</a>.
          </p></div></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-install-server"></a>3.2. Service Manager Installation</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-begin-server-install-windows-osx">3.2.1. The Service Manager: Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-server-install-unix">3.2.2. Installing the Service Manager on Unix</a></span></dt></dl></div><p>
      The MySQL Network Service Manager is the core element of the MySQL Network Monitoring and Advisory Service. The
      installation process for this element is completely
      self-contained. The following components are installed as part of
      the MySQL Network Service Manager.
    </p><div class="table"><a name="id2466712"></a><p class="title"><b>Table 3.1. Components installed</b></p><table summary="Components installed" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Component</strong></span></th><th><span class="bold"><strong>Version</strong></span></th></tr></thead><tbody><tr><td>Tomcat</td><td>5.5.23</td></tr><tr><td>MySQL</td><td>5.x</td></tr><tr><td>Java</td><td>1.5.0_11</td></tr></tbody></table></div><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        On Mac OS X, Java must be installed prior to the installation of
        the MySQL Network Service Manager. Mac OS X versions 10.4 and higher come with
        the correct version of Java installed.
      </p></div><p>
      Although MySQL Network Monitoring and Advisory Service does not use the well known ports for the
      resources it installs, we recommend that you run the MySQL Network
      Service Manager on a dedicated server. Doing this avoids
      competition with other applications that may use the same
      resources and ports.
    </p><p>
      During installation default values are shown for user names,
      passwords, and ports. This is for your convenience only; you may
      choose different values. However, the installer does detect ports
      that are already in use and allows you to select different ports.
    </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
        The MySQL Network Service Manager version 1.2 requires agents with a version
        number of 1.2 or higher. If you are updating to version 1.2
        please update the MySQL Network Service Agent at the same time.
      </p></div><p>
      The MySQL Network Service Manager installation process is documented by
      platform. The following section shows installation on Windows and
      Mac OS X. Unix users may skip ahead to
      <a href="#mnmas-server-install-unix" title="3.2.2. Installing the Service Manager on Unix">Section 3.2.2, “Installing the Service Manager on Unix”</a>.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-begin-server-install-windows-osx"></a>3.2.1. The Service Manager: Windows and Mac OS X</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-issues-specific-to-osx">3.2.1.1. Issues Specific to Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-service-manager-install-common">3.2.1.2. Installing the Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-starting-network-services-windows">3.2.1.3. Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows</a></span></dt></dl></div><p>
        On Mac OS X there are three installation modes
        <code class="literal">osx</code>, <code class="literal">text</code>, and
        <code class="literal">unattended</code>. On Windows the installation modes
        are <code class="literal">win32</code> and <code class="literal">unattended</code>
        only. <span class="emphasis"><em>Note</em></span>: in order to install the Service Manager
        as a Windows service, you must do the installation as a privileged user.
      </p><p>
        <code class="literal">unattended</code> mode is especially useful if you
        are doing multiple installations. For more information on this
        topic see <a href="#mnmas-unattended-installation" title="3.7. Unattended Installation">Section 3.7, “Unattended Installation”</a>. The
        <code class="literal">text</code> mode installation for Mac OS X is
        identical to <code class="literal">text</code> installation under Unix.
        See <a href="#mnmas-server-install-unix" title="3.2.2. Installing the Service Manager on Unix">Section 3.2.2, “Installing the Service Manager on Unix”</a> for
        instructions.
      </p><p>
        This chapter describes the graphic installation mode;
        <code class="literal">win32</code> on Windows and <code class="literal">osx</code>
        on Mac OS X. This is the default mode on both operating systems
        (OS). Find below the minor differences between installation on
        Windows and Mac OS X:
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            On Mac OS X, Java must be installed prior to the
            installation of the MySQL Network Service Manager.
          </p></li><li><p>
            The installation file extensions are OS-specific.
          </p></li><li><p>
            The installation directories differ.
          </p></li></ul></div><p>
        The section that follows is specific to Mac OS X. Windows users
        may skip ahead to
        <a href="#mnmas-service-manager-install-common" title="3.2.1.2. Installing the Service Manager">Section 3.2.1.2, “Installing the Service Manager”</a>.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-issues-specific-to-osx"></a>3.2.1.1. Issues Specific to Mac OS X</h4></div></div></div><p>
          Installing the MySQL Network Service Manager on Mac OS X requires an
          existing installation of Java. The minimum required version is
          1.5.0_6. If this version is not installed on your machine you
          can download it from Apple. This version of Java requires Mac
          OS X version 4.5 as a minimum, so you may need to upgrade your
          operating system in order to install it.
        </p><p>
          For reasons of backwards compatibility, Mac OS X is usually
          installed with multiple versions of Java. When installing in
          <code class="literal">osx</code> mode, version 1.5.0_6 must be the
          default version. Upon installation, Java 1.5.0_6 sets itself
          as the default so this is usually not a problem.
        </p><p>
          If you have changed the default you can reset it or you may
          install the MySQL Network Service Manager in <code class="literal">text</code> mode,
          setting the environment variables to point to the correct
          version of Java. To install in <code class="literal">text</code> mode,
          find the <code class="filename">installbuilder</code> file in the
          <code class="filename">Contents/MacOS</code> directory immediately
          below the
          <code class="filename">mysqlnetwork-<em class="replaceable"><code>version</code></em>-osx-installer.app</code>
          directory. Installing the MySQL Network Service Manager in
          <code class="literal">text</code> mode is identical to the procedure
          described in <a href="#mnmas-server-install-unix" title="3.2.2. Installing the Service Manager on Unix">Section 3.2.2, “Installing the Service Manager on Unix”</a> with
          the minor differences noted above.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-service-manager-install-common"></a>3.2.1.2. Installing the Service Manager</h4></div></div></div><p>
          To install the Service Manager, find the executable file named
          <code class="filename">mysqlnetwork-<em class="replaceable"><code>version</code></em>-windows-installer.exe</code>
          (where <em class="replaceable"><code>version</code></em> represents the
          three-part version number). Double click this file to launch
          it. On Mac OS X this file is called,
          <code class="filename">mysqlnetwork-<em class="replaceable"><code>version</code></em>-osx-installer.app</code>.
          Again, launch it by double clicking it.
        </p><p>
          On Mac OS X, because there may be multiple versions of Java on
          your machine, you will be asked to identify the version of
          Java you wish to use. Choose version 1.5.0_6 or higher. This
          is not an issue on Windows because Java is part of the
          MySQL Network Service Manager installation.
        </p><p>
          Confirmation of the default installation directory follows. On
          Windows this is <code class="filename">C:\Program
          Files\MySQL\Network\Monitoring</code> and on Mac OS X it
          is
          <code class="filename">/Applications/mysql/network/monitoring</code>.
          This is a recommendation only and can be changed.
        </p><p>
          You will need to confirm a number of other items. Those items
          are listed below with their default values. As with the
          installation directory, the values shown below are
          recommendations only. You may change them as required.
        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Tomcat server port – <code class="literal">18080</code>
            </p></li><li><p>
              Tomcat shutdown port – <code class="literal">18005</code>
            </p></li><li><p>
              Tomcat SSL port – <code class="literal">18443</code>
            </p></li><li><p>
              Should communication between Dashboard and Service Manager
              be encrypted – <code class="literal">No</code>
            </p></li><li><p>
              Repository Username –
              <code class="literal">service_manager</code>
            </p><p>
              This is the user name for the bundled MySQL database that
              stores historical information about your servers. When
              specifying a username or password for the Repository user
              follow the guidelines given at
              <a href="http://dev.mysql.com/doc/refman/5.0/en/user-names.html" target="_top">http://dev.mysql.com/doc/refman/5.0/en/user-names.html</a>.
            </p></li><li><p>
              Password for the Repository Username – <code class="literal">No
              Default</code>
            </p></li><li><p>
              Repository Port – <code class="literal">13306</code>
            </p></li></ul></div><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
            The repository username and password are stored in
            unencrypted form in the
            <code class="filename">config.properties</code> file. Depending upon
            your OS, the location of this file is as follows:

            </p><div class="itemizedlist"><ul type="disc"><li><p>
                  Windows – <code class="filename">C:\Program
                  Files\MySQL\Network\Monitoring\apache-tomcat\webapps\merlin\</code>
                </p></li><li><p>
                  Mac OS X –
                  <code class="filename">/Applications/mysql/network/monitoring/apache-tomcat/webapps/merlin</code>
                </p></li></ul></div><p>
          </p></div><p><a name="mnmas-configuration-report"></a>
          At this point, the location of the file containing your
          settings is displayed on the screen. This file is called
          <code class="filename">configuration_report.txt</code> and is stored in
          the installation directory chosen on the first screen. Be sure
          to follow the instructions and store this report in a secure
          location—it's the only record of your passwords and you
          will need it for future reference. Press
          <span class="guibutton">Next</span> to initiate installation; the
          process may take a few minutes to complete.
        </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            If the Windows firewall is enabled you will be asked to
            unblock ports for Apache/Tomcat and the MySQL server.
          </p></div><p>
          Instructions for starting the MySQL Network Monitoring and Advisory Service services under Windows
          are given in the following section. For instructions on
          starting these services under Mac OS X go to
          <a href="#mnmas-starting-network-services-unix-osx" title="3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X">Section 3.2.2.1, “Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X”</a>.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-starting-network-services-windows"></a>3.2.1.3. Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows</h4></div></div></div><p>
          You can choose to start up the MySQL Network Service Manager on
          installation. The installed services are called:

          

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                MySQL Network Tomcat
              </p></li><li><p>
                MySQL Network MySQL
              </p></li></ul></div><p>
        </p><p>
          You can stop or start the services from the Microsoft
          Management Console Services window. Look for the
          <code class="literal">MySQL Network Tomcat</code> and the <code class="literal">MySQL
          Network MySQL</code> entries.
        </p><p>
          To start or stop a service, right click it and choose from the
          options in the pop-up menu.
        </p><p>
          There are also a menu entry for starting and stopping the
          services. Navigate to the <code class="literal">Program</code>,
          <code class="literal">MySQL</code>, <code class="literal">MySQL Network Monitoring
          and Advisory Service</code>, <code class="literal">Services</code>
          entry to stop or start the services.
        </p><p>
          You can also stop or start a service from the command line. To
          start the Tomcat service type:
        </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc start MySQLNetworkTomcat</code></strong> 
</pre><p>
          To stop this service type:
        </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc stop MySQLNetworkTomcat</code></strong>
</pre><p>
          In similar fashion, you may stop or start the MySQL server
          from the command line. The service name is
          <code class="literal">MySQLNetworkMySQL</code>.
        </p><p>
          Configuration of the Dashboard begins immediately after the
          Service Manager is installed. To continue a Windows
          installation skip the next section and go to
          <a href="#mnmas-configuration-settings-advisor-installation" title="3.3. Configuration Settings and Advisor Installation">Section 3.3, “Configuration Settings and Advisor Installation”</a>.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-server-install-unix"></a>3.2.2. Installing the Service Manager on Unix</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-starting-network-services-unix-osx">3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X</a></span></dt></dl></div><p>
        To install the Service Manager find the file named
        <code class="filename">mysqlnetwork-<em class="replaceable"><code>version</code></em>-installer.bin</code>
        (where <em class="replaceable"><code>version</code></em> indicates the version
        number, the OS, and the architecture ). Ensure that this file is
        executable by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>chmod +x mysqlnetwork-<em class="replaceable"><code>version</code></em>-installer.bin</code></strong>
</pre><p>
        To install to the default directory
        (<code class="filename">/opt/mysql/network/monitoring</code>) you need to
        be logged in as <code class="literal">root</code>. Installing as an
        unprivileged user installs to the
        <code class="filename">/home/<em class="replaceable"><code>user_name</code></em>/mysql/monitoring/</code>
        directory. <span class="emphasis"><em>Note</em></span>: If you install the Service
        manager as an unprivileged user, it will not automatically start
        up on rebooting.
      </p><p>
        What follows describes installation from the command line. You
        may install the Service Manager graphically by running the
        installer from within a windows manager. In both cases the steps
        are identical. You may also install the Service Manager in
        <code class="literal">unattended</code> mode. This is especially useful if
        you are doing multiple installations. For more information on
        this topic see, <a href="#mnmas-unattended-installation" title="3.7. Unattended Installation">Section 3.7, “Unattended Installation”</a>.
      </p><p>
        Begin installation by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>./mysqlnetwork-<em class="replaceable"><code>version</code></em>-installer.bin</code></strong>
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          The default ports are shown for your convenience only; the
          installer detects ports that are already in use and allows you
          to select different ports.
        </p></div><p>
        The installation process is shown in the following listing.
        Default values are shown between square brackets; to select them
        press <span class="guibutton">Enter</span>. Otherwise, enter a value of
        your choosing.
      </p><pre class="programlisting">Please specify the directory where the MySQL Network Monitoring »
 and Advisory Service will be installed.

Installation directory [/opt/mysql/network/monitoring/]: 
 

----------------------------------------------------------------------------

Tomcat Server Options


Please specify the following parameters for the bundled Tomcat Server


Tomcat Server Port [18080]: 


Tomcat Shutdown Port [18005]: 


Tomcat SSL Port [18443]: 


----------------------------------------------------------------------------

Repository Configuration

Please specify the following parameters for the bundled MySQL server


Repository Username  [service_manager]:

Password :

Re-enter :

Bundled MySQL Database Port [13306]: 


Base Directory [/opt/mysql/network/monitoring/apache-tomcat/webapps/merlin/mysql]: 


Data Directory [/opt/mysql/network/monitoring/apache-tomcat/webapps/merlin/mysql/data]: 


</pre><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          The location of the file containing the settings specified
          during installation is then displayed on the screen. Be sure
          to follow the instructions and store this report in a secure
          location. There is no password recovery feature.
        </p></div><pre class="programlisting">----------------------------------------------------------------------------
  
Configuration Report 

Note:

The settings you specified will be saved here:

/opt/mysql/network/monitoring/configuration_report.txt

IMPORTANT: This configuration report includes passwords stored in plain text; it 
is intended to help you install and configure your agents. We strongly advise 
you to secure or delete this text file immediately after installation.
			

Press [Enter] to continue : 


Setup is now ready to begin installing MySQL Network Monitoring and »
 Advisory Service on your computer. 

Do you want to continue? [Y/n]: Y
        
Please wait while Setup installs MySQL Network Monitoring and »
 Advisory Service on your computer.       
</pre><p>
        The installation process may take a few minutes to complete.
        Upon completion you should see:
      </p><pre class="programlisting">Completed installing files



Setup has completed installing MySQL Network files on your computer

Uninstalling the MySQL Network files can be done by invoking:

/opt/mysql/network/monitoring/uninstall



To complete the installation, launch the MySQL Enterprise Dashboard and complete 

the initial setup and product activation information. Refer to the readme file 

for additional information and a list of known issues.



Please press next to launch the Dashboard.

Press [Enter] to continue : 


----------------------------------------------------------------------------

Setup has finished installing MySQL Network Monitoring and Advisory Service on your computer.


Launch MySQL Network Monitoring &amp; Advisory Service now [Y/n]: 


Info: To access the MySQL Network Monitoring &amp; Advisory Service please visit the 

following page: http://localhost:18080/merlin/Auth.action

Press [Enter] to continue : 
</pre><p>
        The Enterprise Dashboard will not start up automatically if you
        perform a <code class="literal">text</code> mode installation. To
        configure the MySQL Network Monitoring and Advisory Service, open your browser and enter the URL
        <code class="literal">http://localhost:18080/merlin/Auth.action </code>
        into the address bar.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-starting-network-services-unix-osx"></a>3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X</h4></div></div></div><p>
          The services incorporated into the MySQL Network Service Manager are:

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                The MySQL Server
              </p></li><li><p>
                The Apache/Tomcat Server
              </p></li></ul></div><p>
        </p><p>
          Should you need to stop, start, or restart the MySQL Network Service Manager
          call the <code class="filename">mysqlnetworkctl.sh</code> file located
          in the <code class="filename">/opt/mysql/network/monitoring/</code>
          directory on Unix or the
          <code class="filename">/Applications/mysql/network/monitoring/</code>
          on Mac OS X. To see all the available options navigate to the
          appropriate directory and type:
        </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>/opt/mysql/network/monitoring/mysqlnetworkctl.sh help</code></strong>
</pre><p>
          Executing this script will produce the following output:
        </p><pre class="programlisting">usage: ./mysqlnetworkctl.sh help
./mysqlnetworkctl.sh (start|stop|restart)

help       - this screen
start      - start the service(s)
stop       - stop  the service(s)
restart    - restart or start the service(s)
</pre><p>
          Using this script you can stop, start, or restart all the
          Service Manager components. If you installed the
          MySQL Network Service Manager as an unprivileged user, the application will
          not restart automatically on reboot. To do this make a call to
          <code class="filename">mysqlnetworkctl.sh start</code> script from your
          start-up script.
        </p><p>
          Configuration of the Dashboard begins immediately after the
          Service Manager is installed.
        </p></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-configuration-settings-advisor-installation"></a>3.3. Configuration Settings and Advisor Installation</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-first-login-dashboard">3.3.1. Initial Dashboard Log-in</a></span></dt><dt><span class="section"><a href="#localization">3.3.2. Setting the Timezone and Locale</a></span></dt><dt><span class="section"><a href="#mnmas-advisor-installation-after-login">3.3.3. Installing Advisors After Initial Log-in</a></span></dt><dt><span class="section"><a href="#mnmas-upgrading-updating-advisors">3.3.4. Upgrading and Updating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-outgoing-email-settings">3.3.5. Outgoing Email Settings</a></span></dt></dl></div><p>
      The Dashboard is the web-based interface to the Service Manager so
      the procedure for starting the Dashboard is identical for all
      platforms. From the Dashboard you can configure the settings
      necessary for receiving updates from MySQL Enterprise and for the
      initial installation of the Service Advisors.
    </p><p>
      If you installed the Service Manager using a graphical interface,
      you have the option of launching the Dashboard on the final
      installation screen (as long as the <span class="guibutton">Launch
      MySQL Network Now</span> checkbox is checked).
    </p><p>
      Otherwise, you can view the Dashboard by typing
      <code class="literal">http://localhost:<em class="replaceable"><code>18080</code></em>/merlin/Auth.action</code>
      into the address bar of your web browser. If you are unsure of the
      hostname and port to use, check the
      <code class="filename">configuration_report.txt</code> file.
    </p><p>
      Under Windows it is also possible to open the Dashboard by
      choosing the <code class="literal">MySQL</code> menu item and finding the
      <code class="literal">MySQL Network Monitoring and Advisory Service</code>
      entry. Under this entry choose <code class="literal">Start Service
      Manager</code>.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-first-login-dashboard"></a>3.3.1. Initial Dashboard Log-in</h3></div></div></div><p>
        If this is the first time that you have attempted to log in to
        the Dashboard you should see a screen similar to the following:

        
      </p><div class="figure"><a name="id2467995"></a><p class="title"><b>Figure 3.1. Initial Dashboard log-in</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/first-dashboard-login-1.2.png" alt="Initial Dashboard log-in"></div></div><p>
        This screen allows you to perfom the following tasks:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Install the Advisors
            </p></li><li><p>
              Set up your MySQL Enterprise credentials
            </p></li><li><p>
              Create a username and password for the Dashboard
              administrator
            </p></li><li><p>
              Create a username and password for the Service Agent
            </p></li></ul></div><p>
      </p><p>
        If you have been provided with a <code class="literal">MySQL Enterprise
        Product Key</code> and an Advisors file click the
        <span class="guibutton">browse</span> button and locate these files. The
        advisor file will bear the name,
        <code class="filename">AdvisorScript-<em class="replaceable"><code>version</code></em>.jar</code>
        and the product key,
        <code class="filename"><em class="replaceable"><code>Subscription-level_date</code></em>.xml</code>.
        If you do not allow Internet access from the Dashboard you must
        install the advisors in this way. It is strongly recommended
        that you install the Advisors at this point, but you may do so
        later. For instructions on doing this see,
        <a href="#mnmas-advisor-installation-after-login" title="3.3.3. Installing Advisors After Initial Log-in">Section 3.3.3, “Installing Advisors After Initial Log-in”</a>. If the
        product key that you provide is invalid a notification appears
        and you will be unable to import the advisors.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          If you do not have Internet access from the Dashboard enter
          only the product key and <span class="emphasis"><em>not</em></span> your MySQL
          credentials; entering both produces an error message.
        </p></div><p>
        If you have Internet access from the Dashboard, activate
        MySQL Network Monitoring and Advisory Service by supplying your MySQL Enterprise credentials. Enter
        your email address as the <code class="literal">MySQL Enterprise
        Login</code> and enter and confirm your MySQL Enterprise
        password. If you specify incorrect credentials you will receive
        the error message, “<span class="quote">Unable to connect to verify
        credentials.</span>”
      </p><p>
        In the <span class="guilabel">Create Administrator</span> section of this
        screen, enter credentials for the Dashboard administrator. This
        will create the <code class="literal">root user</code> described in
        <a href="#mnmas-created-users" title="3.1.2.2. User Created During Installation">Section 3.1.2.2, “User Created During Installation”</a>. Make note of the username
        and password as these credentials will be required for any
        future login.
      </p><p>
        In the <span class="guilabel">Configure Agent Credentials</span> section
        of this screen enter the credentials for the agent. This is the
        <code class="literal">agent user</code> also described in
        <a href="#mnmas-created-users" title="3.1.2.2. User Created During Installation">Section 3.1.2.2, “User Created During Installation”</a>. The agent needs to log in
        in order to report its findings. Make note of the agent's
        credentials; this information is required when installing the
        agent.
      </p><p>
        When all the settings have been specified, click the
        <span class="guibutton">complete setup</span> button. If you log in
        successfully you should see a message displaying the number of
        graphs and advisors that have been imported. This number varies
        depending upon your subscription level.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="localization"></a>3.3.2. Setting the Timezone and Locale</h3></div></div></div><p>
        If this is the first time that you have launched the Dashboard
        you will be asked to set your time zone and locale. Choose the
        appropriate values from the drop-down list boxes. Setting the
        time zone ensures that you have an accurate time reference for
        any notifications from the MySQL Network Advisors.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          It is especially important that the time zone be set correctly
          as this may also affect the way the graphs display. For this
          reason, also ensure that the time reported by the operating
          system is correct. To change the time zone or locale see
          <a href="#mnmas-user-preferences" title="6.2. User Preferences">Section 6.2, “User Preferences”</a>.
        </p></div><p>
        After specifying your time zone and locale, the Dashboard opens
        on the <code class="literal">Monitor</code> page. For a detailed
        examination of the <code class="literal">Monitor</code> Screen see,
        <a href="#mnmas-exploring-monitor" title="Chapter 5. Exploring the Monitor Screen">Chapter 5, <i>Exploring the Monitor Screen</i></a>.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-advisor-installation-after-login"></a>3.3.3. Installing Advisors After Initial Log-in</h3></div></div></div><p>
        The Service Advisors interpret the data sent by the Service
        Agents and display the results in the Dashboard. A minimal set
        of Advisors are preinstalled with the Service Manager. To obtain
        the full set of Advisors and get the most value from the
        MySQL Network Monitoring and Advisory Service, you must download Advisors from MySQL Enterprise.
      </p><p>
        If you did not install the Advisors when you first logged in to
        the the MySQL Network Enterprise Dashboard, open the Dashboard, find the
        <code class="literal">Advisors</code> tab, and choose the <code class="literal">Check
        for Updates</code> link. Doing this downloads the latest
        version of the Advisors from the MySQL Enterprise web site. In
        order to install the advisors in this fashion you must specify
        your MySQL Enterprise credentials. Find instructions for doing
        this in <a href="#mnmas-global-preferences" title="6.1. Global Preferences">Section 6.1, “Global Preferences”</a>.
      </p><p>
        If you do not allow Internet access from the Dashboard, you will
        have to install the Service Advisors from a local file. To do
        this you need an advisor file bearing the name,
        <code class="filename">AdvisorScript-<em class="replaceable"><code>version</code></em>.jar</code>.
        If you don't already have this file, you can find it on the
        MySQL Enterprise downloads page. Choose the Advisors file
        suitable for your operating system, downloading it to a location
        that is accessible from the Dashboard. Use the
        <span class="guibutton">Browse</span> button to find the
        Advisors file and then choose
        <span class="guibutton">Import</span> to load the advisors.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-upgrading-updating-advisors"></a>3.3.4. Upgrading and Updating Advisors</h3></div></div></div><p>
        The process for upgrading advisors is exactly the same as
        installation. Advisors are updated by choosing the
        <span class="guibutton">update</span> button on the <code class="literal">Check for
        Updates</code> page. If you do not have Internet access from
        the Dashboard you can import the Advisors from a local file as
        described in
        <a href="#mnmas-advisor-installation-after-login" title="3.3.3. Installing Advisors After Initial Log-in">Section 3.3.3, “Installing Advisors After Initial Log-in”</a>.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          You may choose to upgrade your MySQL Network Monitoring and Advisory Service subscription level at
          any time.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-outgoing-email-settings"></a>3.3.5. Outgoing Email Settings</h3></div></div></div><p>
        Alert notification via email is a key component of the MySQL Network Monitoring and Advisory Service
        Advisor solution. For this reason you may want to immediately
        configure an SMTP account for at least one recipient.
      </p><p>
        To do this choose the <code class="literal">Settings</code> tab and go to
        the <code class="literal">Global Preferences</code> screen by clicking the
        appropriate link. Here you can configure the email settings.
        These settings apply to the currently logged-in user.
      </p><p>
        Find the <code class="literal">Outgoing Email Settings</code> on the left
        of this page.
      </p><div class="figure"><a name="id2468515"></a><p class="title"><b>Figure 3.2. Outgoing email settings</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/email-settings.png" alt="Outgoing email settings"></div></div><p>
        Ensure that the <code class="literal">Enable Email Notifications</code>
        checkbox is checked and enter information as appropriate.
      </p><p>
        The default value for the SMTP port is <code class="literal">25</code>. If
        your mail server runs on a different port simply specify it,
        separating it from the server name using a colon. For example,
        if your mail server runs on port 587 enter
        <code class="literal"><em class="replaceable"><code>email.myserver.com</code></em>:587</code>
        into the <span class="guilabel">SMTP Server</span> text box.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          An email server must be available for sending email alerts.
        </p><p>
          The SMTP client uses Transport Layer Security (TLS) if the
          SMTP server supports it.
        </p><p>
          The settings page is dealt with in more detail in
          <a href="#mnmas-configuring-dashboard-settings" title="Chapter 6. Configuration Settings">Chapter 6, <i>Configuration Settings</i></a>.
        </p></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-install-agent"></a>3.4. Service Agent Installation</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-agent-rights">3.4.1. Creating a MySQL User Account for the Service Agent</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-windows">3.4.2. Installing the Agent on Microsoft Windows and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-windows">3.4.3. Starting and Stopping the Agent on Windows</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-osx">3.4.4. Starting and Stopping the Agent on Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-unix">3.4.5. Installing the Service Agent on Unix</a></span></dt><dt><span class="section"><a href="#mnmas-starting-agent-unix">3.4.6. Starting and Stopping the Agent on Unix</a></span></dt></dl></div><p>
      A MySQL Network Service Agent monitors a MySQL server and sends data to the
      Service Advisors. These data are interpreted and displayed in the
      Dashboard. The Service Agent is installed on all platforms using
      the steps described in the next section.
    </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
        The MySQL Network Service Manager version 1.2 requires agents with a version
        number of 1.2 or higher.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-agent-rights"></a>3.4.1. Creating a MySQL User Account for the Service Agent</h3></div></div></div><p>
        When setting up an agent to monitor a MySQL server you need to
        ensure that there is a user account for the agent on that
        server.
      </p><p>
        The privileges required for this user account vary depending on
        the information you wish to gather using the MySQL Network Service Agent. The
        following privileges will allow the Service Agent to perform its
        assigned duties without limitation:
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            <code class="literal">SHOW DATABASES</code>: Allows the MySQL Network Service Agent
            to gather inventory about the monitored MySQL server.
          </p></li><li><p>
            <code class="literal">REPLICATION CLIENT</code>: Allows the
            MySQL Network Service Agent to gather Replication master/slave status
            data. This privilege is only needed if the MySQL Replication
            Advisor Rules are employed.
          </p></li><li><p>
            <code class="literal">SELECT</code>: Allows the MySQL Network Service Agent to
            collect statistics for table objects.
          </p></li><li><p>
            <code class="literal">SUPER</code>: Allows the MySQL Network Service Agent to
            execute, <code class="literal">SHOW ENGINE INNODB STATUS</code>, in
            order to collect data about InnoDB tables
          </p></li></ul></div><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          If the agent does not have the <code class="literal">SUPER</code>
          privilege and InnoDB-related rules are scheduled, an error
          will appear in the <code class="literal">DataCollection</code> log.
        </p></div><p>
        For example, the following <code class="literal">GRANT</code> statement
        will give the agent all rights:
      </p><pre class="programlisting">GRANT SELECT, REPLICATION CLIENT, SHOW DATABASES, SUPER
  ON *.* 
  TO  '<em class="replaceable"><code>mysqluser</code></em>'@'<em class="replaceable"><code>localhost</code></em>' 
  IDENTIFIED BY '<em class="replaceable"><code>agent_password</code></em>';
</pre><p>
        In a typical configuration, the agent runs on the same machine
        as the MySQL server it is monitoring so the host name will be
        <em class="replaceable"><code>localhost</code></em>. However, this will change
        if the agent is running on a machine other than the one that
        hosts the monitored MySQL server. In this case, change
        <em class="replaceable"><code>localhost</code></em> to the appropriate value.
        The username for the agent defaults to
        <em class="replaceable"><code>mysqluser</code></em> during installation, but
        the username may be any value of your choosing.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-install-agent-windows"></a>3.4.2. Installing the Agent on Microsoft Windows and Mac OS X</h3></div></div></div><p>
        To install the MySQL Network Service Agent on Windows, double-click the
        <code class="filename">mysqlserviceagent-<em class="replaceable"><code>version</code></em>-windows-installer.exe</code>
        (where <em class="replaceable"><code>version</code></em> indicates the
        three-part version number) installer. <span class="emphasis"><em>Note</em></span>: in order to install the agent
        as a Windows service, you must do the installation as a privileged user.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          You may also install the Service Agent in
          <code class="literal">unattended</code> mode. This is especially useful
          if you are doing multiple installations. For more information
          on this topic see,
          <a href="#mnmas-unattended-installation" title="3.7. Unattended Installation">Section 3.7, “Unattended Installation”</a>.
        </p></div><p>
        On Mac OS X decompress the
        <code class="filename">mysqlserviceagent-<em class="replaceable"><code>version</code></em>-installer.app.zip</code>
        and then run the
        <code class="filename">mysqlnetworkagent-<em class="replaceable"><code>version</code></em>-installer</code>
        application.
      </p><p>
        After agreeing to the MySQL Network Monitoring and Advisory Service license, and choosing an
        installation directory, you will be asked to provide information
        about the location, port, and credentials for the repository:
      </p><div class="figure"><a name="id2468888"></a><p class="title"><b>Figure 3.3. The repository information screen</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/agent-login.png" alt="The repository information screen"></div></div><p>
        Click <span class="guibutton">Next</span> and enter information about
        the location of the MySQL Network Service Manager. As with the location of the
        installation directory, the default values are recommendations
        only. You may change them as required.
      </p><p>
        Agents need a MySQL Network Service Manager account in order to send data to
        the MySQL Network Service Manager, so next enter the username and password for
        the MySQL Network Service Agent. The default value for the agent's Dashboard
        username is <code class="literal">agent</code>. There is no default value
        for the password. Use the values that you specified when you
        first logged in to Dashboard. (For more information on this
        topic see <a href="#mnmas-first-login-dashboard" title="3.3.1. Initial Dashboard Log-in">Section 3.3.1, “Initial Dashboard Log-in”</a>.)
      </p><p>
        If you wish, choose an appropriate display hostname for the
        monitored server. This is the name that will appear in the
        MySQL Network Enterprise Dashboard. If you do not specify a value, the assigned
        hostname is a concatenation of the IP address or hostname and
        the MySQL port number, for example
        <code class="literal"><em class="replaceable"><code>myserver:3306</code></em></code>.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          Note that only alphanumeric characters, periods, dashes,
          underscores, and parentheses are legal characters for this
          element. Any illegal characters are replaced with a dash,
          which may result in a non-unique
          <code class="literal">server-name</code> if two names differ only by
          that character. Hostnames must be unique to specific machines.
          No two machines may have the same hostname. If you plan to run
          more than one agent on the same machine the hostname is
          <span class="bold"><strong>not</strong></span> optional. For more
          information see, <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
        </p></div><p>
        After choosing these settings, the contents and location of the
        agent configuration report displays on the screen. Confirm that
        the settings are correct before beginning the installation
        process.
      </p><p>
        Once the Service Agent is installed, it needs to be started.
        Instructions for doing this under Windows follow immediately. To
        do this on Mac OS X skip ahead to
        <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-starting-agent-windows"></a>3.4.3. Starting and Stopping the Agent on Windows</h3></div></div></div><p>
        You have the option of starting the Service Agent from the final
        installation screen. Otherwise you can do this by going to the
        <code class="literal">Start Menu</code> and under
        <code class="literal">Programs</code> find <code class="literal">MySQL</code> and
        then the <code class="literal">MySQL Network Service Agent</code> entry.
        Simply select <code class="literal">Start MySQL Network Service Agent
        Service</code>.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          To report its findings, the agent needs to be able to connect
          to the Dashboard through the port specified during
          installation. The default value for this port is
          <code class="literal">18080</code>; ensure that this port is not
          blocked. If you need help troubleshooting the agent
          installation see,
          <a href="#mnmas-troubleshooting-agent-start" title="3.6. Troubleshooting the Agent">Section 3.6, “Troubleshooting the Agent”</a>.
        </p></div><p>
        Alternately, you can start the agent from the command line by
        entering:
      </p><pre class="programlisting">C:\&gt; <code class="literal">sc start MySQLNetworkServiceAgent</code>
</pre><p>
        For confirmation that the service is running you can open the
        Microsoft Management Console Services window. Find the service
        <code class="literal">MySQL Network Service Agent</code> and you should
        see something similar to the image shown in
        <a href="#mnmas-agent-started" title="Figure 3.4. Windows services">Figure 3.4, “Windows services”</a>.
      </p><div class="figure"><a name="mnmas-agent-started"></a><p class="title"><b>Figure 3.4. Windows services</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/agent-started.png" alt="Windows services"></div></div><p>
        You may also start the agent from this window rather than from
        the <code class="literal">Start</code> menu or the command line. Simply
        right click <code class="literal">MySQL Network Service Agent</code> and
        choose <code class="literal">Start</code> from the pop-up menu. Starting
        the agent from this window opens an error dialog box if the
        Agent cannot connect to the MySQL server it is monitoring. No
        error is displayed if the Agent is unable to connect to the
        MySQL Network Service Manager.
      </p><p>
        The pop-up menu for starting the agent also offers the option of
        stopping the agent. To stop the agent from the command line you
        only need type:
      </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc stop MySQLNetworkServiceAgent</code></strong>
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          <code class="literal">MySQLNetworkServiceAgent</code> is the default
          name of the Service Agent service. If you have added an
          additional agent as described in
          <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>, replace
          <code class="literal">MySQLNetworkServiceAgent</code> with the
          appropriate agent name.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-starting-agent-osx"></a>3.4.4. Starting and Stopping the Agent on Mac OS X</h3></div></div></div><p>
        The script to start the Agent on Mac OS X is located in the
        <code class="filename">/Applications/mysql/network/agent/etc/init.d</code>
        directory. To start the agent navigate to this directory and at
        the command line type:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>./mysql-service-agent start</code></strong>
</pre><p>
        To verify that the agent is running use the following command:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>ps aux | grep mysql-service-agent</code></strong>
</pre><p>
        If the agent is running you should see something like the
        following:
      </p><pre class="programlisting">root     9378  0.0  0.1 161016  3960 ?        Sl   11:20   0:00 »
/Applications/mysql/network/agent/lib/mysql-service-agent/mysql-service-agent  \
-f /Applications/mysql/network/agent/etc/mysql-service-agent.ini
root     9486  0.0  0.0   5000   792 pts/1    S+   11:34   0:00 grep mysql-service-agent
</pre><p>
        If the agent is not running you will only see the
        <code class="literal">grep</code> process. To determine why the agent is
        not running, use the following command to view the last ten
        entries in the agent log file:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>tail /Applications/mysql/network/agent/log/mysql-service-agent.log</code></strong>
</pre><p>
        Installation creates the directory
        <code class="filename">/Applications/mysql/network/agent</code> with the settings
        stored in the <code class="literal">mysql-service-agent.ini</code> file
        located directly below this directory in the
        <code class="filename">etc</code> directory. The <code class="filename">log</code>
        directory is also located immediately below the agent directory.
      </p><p>
        To see all the command-line options available when running the
        service agent, navigate to the
        <code class="filename">/Applications/mysql/network/agent/etc/init.d</code>
        directory and execute <strong class="userinput"><code>mysql-service-agent</code></strong>
        <code class="option">help</code>. You should see the message:
      </p><pre class="programlisting">Usage: ./mysql-service-agent {start|stop|restart} [ini-file-name]
</pre><p>
        The <code class="literal">ini-file-name</code> option only needs to be
        used if the <code class="filename">ini</code> file is not installed to
        the default location or you have changed the name of the
        <code class="filename">ini</code> file. You will need to use this option
        if you are installing more than one agent on the same machine.
        Pass the full path to the <code class="filename">ini</code> file. For
        example, after navigating to the
        <code class="filename">/Applications/mysql/network/agent/etc/init.d</code>
        directory, issue the command:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>./mysql-service-agent /Applications/mysql/network/agent/etc/<em class="replaceable"><code>new-mysql-service-agent</code></em>.ini</code></strong>
</pre><p>
        For more information about creating additional agents see,
        <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
      </p><p>
        If you installed the agent as <code class="literal">root</code>, on reboot
        the <code class="literal">mysql-service-agent</code> daemon will start up
        automatically. If you installed the agent as an unprivileged
        user, you will have to manually start the agent on reboot or
        write a script to perform this task. Likewise, if you have added
        an additional agent as described in
        <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>, and you wish to
        start this agent on reboot, create a system initialization
        script appropriate to your operating system.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          To report its findings, the agent needs to be able to connect
          to the Dashboard through the port specified during
          installation. The default value for this port is
          <code class="literal">18080</code>; ensure that this port is not
          blocked. If you need help troubleshooting the agent
          installation see,
          <a href="#mnmas-troubleshooting-agent-start" title="3.6. Troubleshooting the Agent">Section 3.6, “Troubleshooting the Agent”</a>.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-install-agent-unix"></a>3.4.5. Installing the Service Agent on Unix</h3></div></div></div><p>
        As a prerequisite for installing the MySQL Network Service Agent on Linux
        systems you must have the Linux Standards Base (LSB)
        initialization functions installed.
      </p><p>
        To install the agent navigate to the directory that contains the
        file,
        <code class="filename">mysqlserviceagent-<em class="replaceable"><code>version</code></em>-installer.bin</code>
        (where <em class="replaceable"><code>version</code></em> indicates the
        three-part version number, the OS, and the architecture). Ensure
        that this file is executable by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>chmod +x mysqlnetwork-<em class="replaceable"><code>version</code></em>-installer.bin</code></strong>
</pre><p>
        To install to the default directory
        (<code class="filename">/opt/mysql/network/agent</code>) you need to be
        logged in as <code class="literal">root</code>. Installing as an
        unprivileged user installs to the
        <code class="filename">/home/<em class="replaceable"><code>user_name</code></em>/mysql/network/agent</code>
        directory. <span class="emphasis"><em>Note</em></span>: If you install the agent
        as an unprivileged user, it will not automatically start up on
        rebooting.
      </p><p>
        What follows describes installation from the command line. You
        may install the Service Agent graphically by running the
        installer from within a windows manager. In both cases the steps
        are identical. You may also install the Service Agent in
        <code class="literal">unattended</code> mode. This is especially useful if
        you are doing multiple installations. For more information on
        this topic see, <a href="#mnmas-unattended-installation" title="3.7. Unattended Installation">Section 3.7, “Unattended Installation”</a>.
      </p><p>
        Begin installation from the command line by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>./mysqlserviceagent-<em class="replaceable"><code>version</code></em>-installer.bin</code></strong>
</pre><p>
        The various options are shown in what follows. Default values
        are indicated by square brackets; to select them press
        <span class="guibutton">Enter</span>. Otherwise enter a value of your
        choosing.
      </p><pre class="programlisting">  Installation directory [/opt/mysql/network/agent]:   
  
  ----------------------------------------------------------------------------
  
  Database Information
  
  
  MySQL hostname or IP address [127.0.0.1]:  
  
  Validate MySQL hostname or IP address [Y/n]:  
  
  MySQL Port [3306]:   
  
  MySQL Username []: <em class="replaceable"><code>service_agent</code></em> 
  
  MySQL Password :
  
  Re-enter :
  
  ----------------------------------------------------------------------------
  
  MySQL Network Server Options
  
  
  Hostname or IP address [127.0.0.1]: <em class="replaceable"><code>192.168.0.197</code></em> 
  
  Port [18080]: 
  
  Agent Username [agent]:  
  
  Agent Password :
  
  Re-enter : 
  
  Hostname to display []: <em class="replaceable"><code>SuSE</code></em>  
  
  ----------------------------------------------------------------------------
 
</pre><p>
        If you wish, choose an appropriate display hostname for the
        monitored server. This is the name that will appear in the
        MySQL Network Enterprise Dashboard. If you do not specify a value, the assigned
        hostname is a concatenation of the IP address or hostname and
        the MySQL port number, for example
        <code class="literal"><em class="replaceable"><code>myserver:3306</code></em></code>.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          Note that only alphanumeric characters,
          periods, dashes, underscores, and parentheses are legal
          characters for this element. Any illegal characters are
          replaced with a dash, which may result in a non-unique
          <code class="literal">server-name</code> if two names differ only by
          that character. Hostnames must be unique to specific machines.
          No two machines may have the same hostname. If you plan to run
          more than one agent on the same machine the hostname is
          <span class="bold"><strong>not</strong></span> optional. For more
          information see, <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
        </p></div><pre class="programlisting">Here are the settings you specified: 

Installation directory: /opt/mysql/network/agent 

Monitored MySQL Database:  
-------------------------

Hostname or IP address: 127.0.0.1

Port: 3306

MySQL username: <em class="replaceable"><code>mysql_user</code></em>



MySQL Network Service Manager: 
------------------------------

Hostname or IP address: <em class="replaceable"><code>192.168.0.1</code></em>

Port: 18080

Agent username: <em class="replaceable"><code>agent</code></em>

Hostname to display: <em class="replaceable"><code>SuSE10-2</code></em>

Press [Enter] to continue : 


----------------------------------------------------------------------------
  
Setup is now ready to begin installing MySQL Network Service Agent on your computer.

Do you want to continue? [Y/n]: y

----------------------------------------------------------------------------
Please wait while Setup installs MySQL Network Service Agent on your computer.

 Installing
 0% ______________ 50% ______________ 100%
 #########################################

----------------------------------------------------------------------------
Info to start MySQL Agent

The MySQL agent was successfully installed. To start the MySQL Agent please 
invoke:
/opt/mysql/network/agent/etc/init.d/mysql-service-agent start
Press [Enter] to continue : 

----------------------------------------------------------------------------
Setup has finished installing MySQL Network Service Agent on your computer.
</pre></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-starting-agent-unix"></a>3.4.6. Starting and Stopping the Agent on Unix</h3></div></div></div><p>
        When installation is finished, you can start the service agent
        from the command line by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>/opt/mysql/network/agent/etc/init.d/mysql-service-agent start</code></strong>
</pre><p>
        To verify that the agent is running use the following command:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>ps aux | grep mysql-service-agent</code></strong>
</pre><p>
        If the agent is running you should see something like the
        following:
      </p><pre class="programlisting">root     9378  0.0  0.1 161016  3960 ?        Sl   11:20   0:00 »
/opt/mysql/network/agent/lib/mysql-service-agent/mysql-service-agent \
-f /opt/mysql/network/agent/etc/mysql-service-agent.ini
root     9486  0.0  0.0   5000   792 pts/1    S+   11:34   0:00 grep mysql-service-agent
</pre><p>
        If the agent is not running you will only see the
        <code class="literal">grep</code> process. To determine why the agent is
        not running, use the following command to view the last ten
        entries in the agent log file:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>tail /opt/mysql/network/agent/log/mysql-service-agent.log</code></strong>
</pre><p>
        Installation creates the directory
        <code class="filename">/opt/mysql/network/agent</code> with the settings
        stored in the <code class="literal">mysql-service-agent.ini</code> file
        located directly below this directory in the
        <code class="filename">etc</code> directory. The <code class="filename">log</code>
        directory is also located immediately below the agent directory.
      </p><p>
        To see all the command-line options available when running the
        service agent, navigate to the
        <code class="filename">/opt/mysql/network/agent/etc/init.d</code>
        directory and execute <strong class="userinput"><code>mysql-service-agent</code></strong>
        <code class="option">help</code>. You should see the message:
      </p><pre class="programlisting">Usage: ./mysql-service-agent {start|stop|restart} [ini-file-name]
</pre><p>
        The <code class="literal">ini-file-name</code> option only needs to be
        used if the <code class="filename">ini</code> file is not installed to
        the default location or you have changed the name of the
        <code class="filename">ini</code> file. You will need to use this option
        if you are installing more than one agent on the same machine.
        Pass the full path to the <code class="filename">ini</code> file. For
        example, after navigating to the
        <code class="filename">/opt/mysql/network/agent/etc/init.d</code>
        directory, issue the command:
      </p><pre class="programlisting">  shell&gt; <strong class="userinput"><code>./mysql-service-agent /opt/mysql/network/agent/etc/<em class="replaceable"><code>new-mysql-service-agent</code></em>.ini</code></strong>
</pre><p>
        For more information about creating additional agents see,
        <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
      </p><p>
        If you installed the agent as <code class="literal">root</code>, on reboot
        the <code class="literal">mysql-service-agent</code> daemon will start up
        automatically. If you installed the agent as an unprivileged
        user, you will have to manually start the agent on reboot or
        write a script to perform this task. Likewise, if you have added
        an additional agent as described in
        <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>, and you wish to
        start this agent on reboot, create a system initialization
        script appropriate to your operating system.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          To report its findings, the agent needs to be able to connect
          to the Dashboard through the port specified during
          installation. The default value for this port is
          <code class="literal">18080</code>; ensure that this port is not
          blocked. If you need help troubleshooting the agent
          installation see,
          <a href="#mnmas-troubleshooting-agent-start" title="3.6. Troubleshooting the Agent">Section 3.6, “Troubleshooting the Agent”</a>.
        </p></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-advanced-agent-configuration"></a>3.5. Advanced Agent Configuration</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-about-mysql-service-agent-ini">3.5.1. The <code class="filename">mysql-service-agent.ini</code> File</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-multi">3.5.2. Monitoring Multiple Servers</a></span></dt><dt><span class="section"><a href="#mnmas-install-agent-remote">3.5.3. Configuring an Agent to Monitor a Remote MySQL Server</a></span></dt><dt><span class="section"><a href="#mnmas-ssh-tunnel">3.5.4. Monitoring Outside the Firewall with an SSH Tunnel</a></span></dt></dl></div><p>
      This section deals with additional manual changes you may need to
      make to the <code class="filename">mysql-service-agent.ini</code> file.
      This section will be helpful if, for instance, you plan to monitor
      multiple servers either locally or on a remote server.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-about-mysql-service-agent-ini"></a>3.5.1. The <code class="filename">mysql-service-agent.ini</code> File</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-mysqld-configuration">3.5.1.1. <code class="literal">[mysqld]</code> Configuration</a></span></dt><dt><span class="section"><a href="#mnmas-merlind-configuration">3.5.1.2. <code class="literal">[merlind]</code> Configuration</a></span></dt><dt><span class="section"><a href="#mnmas-agent-configuration">3.5.1.3. <code class="literal">[agent]</code> Configuration</a></span></dt></dl></div><p>
        The settings chosen during installation of the agent are saved
        in the <code class="filename">mysql-service-agent.ini</code> file. This
        section gives a brief overview of that file and shows how you
        can fine tune the settings for the agent.
      </p><p>
        On Windows, this file is found in the <code class="filename">C:\Program
        Files\MySQL\Network\Agent</code> directory, on Unix in
        <code class="filename">/opt/mysql/network/agent/etc</code>, and on Mac OS
        X it is in the
        <code class="filename">/Applications/mysql/network/agent/etc</code>
        directory.
      </p><p>
        The <code class="literal">ini</code> file has 3 major sections:
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            The MySQL server being monitored –
            <code class="literal">[mysqld]</code>
          </p></li><li><p>
            The MySQL Network Service Manager to connect to –
            <code class="literal">[merlind]</code>
          </p></li><li><p>
            Agent configuration data – <code class="literal">[agent]</code>
          </p></li></ul></div><p>
        A typical <code class="filename">ini</code> file on Windows might look
        like this:
      </p><pre class="programlisting">[mysqld]
user     = <em class="replaceable"><code>mysqluser</code></em>
password = <em class="replaceable"><code>agent_password</code></em>
hostname = <em class="replaceable"><code>127.0.0.1</code></em>
port     = <em class="replaceable"><code>3306</code></em>

[merlind]
hostname = http://<em class="replaceable"><code>agent:mysql@DashBoard_Host:18080</code></em>/merlin/heartbeat

[agent]
server-name = <em class="replaceable"><code>Finance</code></em>
item-files  = items-mysql-network.xml
log-file    = C:\Program Files\MySQL\Network\Agent\mysql-service-agent.log
basedir     = C:\Program Files\MySQL\Network\Agent\
pid-file    = C:\Program Files\MySQL\Network\Agent\mysql-service-agent.pid
uuid        = <em class="replaceable"><code>29fd5ea9-2440-48aa-8a9e-c4aa2030097e</code></em>
</pre><p>
        On other operating systems, the <code class="literal">item-files</code>,
        <code class="literal">log-file</code>, <code class="literal">basedir</code>, and
        <code class="literal">pid-file</code> items are initialized to different
        values.
      </p><p>
        On Unix the default values are:
      </p><pre class="programlisting">log-file = /opt/mysql/network/agent/log/mysql-service-agent.log
basedir  = /opt/mysql/network/agent/share/mysql-service-agent/
pid-file = /opt/mysql/network/agent/run/mysql-service-agent.pid
</pre><p>
        On Mac OS X the default values are:
      </p><pre class="programlisting">log-file = /Applications/mysql/network/agent/log/mysql-service-agent.log
basedir  = /Applications/mysql/network/agent/share/mysql-service-agent/
pid-file = /Applications/mysql/network/agent/run/mysql-service-agent.pid
</pre><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-mysqld-configuration"></a>3.5.1.1. <code class="literal">[mysqld]</code> Configuration</h4></div></div></div><p>
          The <code class="literal">[mysqld]</code> section shows the host and the
          port used by the monitored MySQL server. If the agent is
          running on the same machine as the MySQL server then the value
          of the MySQL hostname will be <code class="literal">127.0.0.1</code>.
          The port is typically configured as <code class="literal">3306</code>.
          The <code class="literal">[mysqld]</code> section also shows the
          credentials necessary for logging in to this server. These are
          the credentials specified during installation and are found in
          the <code class="literal">Repository Credentials (bundled MySQL)</code>
          section of the <code class="filename">configuration_report.txt</code>
          file.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-merlind-configuration"></a>3.5.1.2. <code class="literal">[merlind]</code> Configuration</h4></div></div></div><p>
          The <code class="literal">[merlind]</code> section shows the agent
          log-in to the Dashboard Service Manager and the hostname or IP
          address, and the port.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-agent-configuration"></a>3.5.1.3. <code class="literal">[agent]</code> Configuration</h4></div></div></div><p>
          In the <code class="literal">[agent]</code> configuration section of the
          <code class="literal">ini</code> file you should find the
          <code class="literal">server-name</code> element if you chose to set
          this value during installation. This name identifies the
          server in the Dashboard and is also referenced in advisor
          alerts. This element is optional except in the circumstances
          defined in <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
          <code class="literal">item-files</code> defines the data items used by
          the Advisors. These files are found in the base directory. For
          more information about <code class="literal">item-files</code> see
          <a href="#mnmas-advisors" title="Chapter 7. The Service Advisors">Chapter 7, <i>The Service Advisors</i></a>.
        </p><p>
          The base directory and the log file for the agent are
          OS-specific and are also defined in the
          <code class="literal">[agent]</code> section. The remaining elements
          show the process id and the unique identifier respectively.
          These elements are discussed in more detail in the following
          section.
        </p><div class="section" lang="en"><div class="titlepage"><div><div><h5 class="title"><a name="mnmas-configure-log-level"></a>3.5.1.3.1. Adding a <code class="literal">log-level</code> Entry</h5></div></div></div><p>
            If you are experiencing difficulties with the MySQL Network Monitoring and Advisory Service, it
            may make sense to add a <code class="literal">log-level</code> entry
            to the <code class="literal">[agent]</code> section of the
            <code class="literal">ini</code> file. Doing this will allow you to
            trace errors.
          </p><p><a name="mnmas-log-error-levels"></a>
            Valid values for <code class="literal">log-level</code> are as
            follows:
          </p><div class="itemizedlist"><ul type="disc"><li><p>
                debug
              </p></li><li><p>
                critical
              </p></li><li><p>
                error
              </p></li><li><p>
                warning
              </p></li><li><p>
                message
              </p></li><li><p>
                info
              </p></li></ul></div><p>
            To show all levels of communication, add the following entry
            to the <code class="literal">[agent]</code> section.
          </p><pre class="programlisting">log-level = debug
</pre><p>
            After changing the log level restart the agent.
          </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
              Be careful when adding a <code class="literal">log-level</code>
              entry to the <code class="literal">ini</code> file. Doing this will
              rapidly increase the size of your
              <code class="filename">mysql-service-agent.log</code> file. To
              avoid disk space problems, put the log files on a
              different drive from your MySQL server and the
              MySQL Network Enterprise Dashboard.
            </p><p>
              It is strongly recommended that you use
              <code class="literal">log-level</code> for debugging purposes only
              and that you remove this option from the
              <code class="filename">ini</code> file when debugging is complete.
            </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h5 class="title"><a name="mnmas-configure-backlog-threshold"></a>3.5.1.3.2. The<code class="literal"> backlog-threshold</code> Option</h5></div></div></div><p>
            There is also a <code class="literal">backlog-threshold</code> option
            for the <code class="literal">[agent]</code> section of an
            <code class="filename">ini</code> file. This option determines the
            amount of time that the agent will collect information after
            detecting that the service manager is down. The default
            value for this option is 600 seconds. In cases where there
            is a short network outage no information will be lost. If
            there is a long outage, excessive memory usage is avoided.
            In most circumstances, there is no need to change this
            option.
          </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
              Setting this option to a value higher than the default can
              quickly exhaust memory.
            </p></div></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-install-agent-multi"></a>3.5.2. Monitoring Multiple Servers</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#id2470869">3.5.2.1. Outline of the Steps</a></span></dt><dt><span class="section"><a href="#mnmas-new-uuid-windows">3.5.2.2. Generate a New UUID: Windows</a></span></dt><dt><span class="section"><a href="#mnmas-creating-new-agent-windows">3.5.2.3. Creating an Agent: Windows</a></span></dt><dt><span class="section"><a href="#mnmas-new-uuid-unix-mac">3.5.2.4. Generate a New UUID: Unix and Mac OS X</a></span></dt><dt><span class="section"><a href="#mnmas-starting-new-agent">3.5.2.5. Starting the New Agent</a></span></dt></dl></div><p>
        There is a one-to-one relationship between agents and monitored
        MySQL servers. If you run more than one MySQL server on a given
        machine, you must install and configure an equal number of
        MySQL Network Service Agents. To do this you need not run the agent install
        file again—simply add another <code class="filename">ini</code>
        file and start up a new agent.
      </p><p>
        You can add another <code class="filename">ini</code> file by copying an
        existing one and modifying the copy. Use caution when changing
        the following elements of the <code class="filename">ini</code> file.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><div class="itemizedlist"><ul type="disc"><li><p>
              <span class="bold"><strong>server-name</strong></span>
            </p><p>
              When running more than one agent on the same machine the
              <code class="literal">server-name</code> <span class="emphasis"><em>must</em></span>
              be used and its value <span class="emphasis"><em>must</em></span> be unique.
              Note that server names are not case sensitive so do
              <span class="bold"><strong>not</strong></span> change only the case
              of a name or the case of one or more letters in a server
              name. Only alphanumeric characters, periods, and dashes
              are legal characters for <code class="literal">server-name</code>.
              Any illegal characters are replaced with a dash, which may
              result in a non-unique <code class="literal">server-name</code> if
              two names differ only by that character.
            </p></li><li><p>
              <span class="bold"><strong>uuid</strong></span>
            </p><p>
              It is very important that each agent have a unique
              universally unique identifier (UUID). If you use one of
              our installers as described in
              <a href="#mnmas-install-agent" title="3.4. Service Agent Installation">Section 3.4, “Service Agent Installation”</a>, a unique UUID is
              automatically generated for you. However, if you manually
              configure agents by copying from an existing file as
              described in this section, you <span class="emphasis"><em>must</em></span>
              generate a new UUID. Instructions for doing this are
              platform-specific and are given in the following sections.
            </p></li><li><p>
              <span class="bold"><strong>log-file</strong></span> and
              <span class="bold"><strong>pid-file</strong></span>
            </p><p>
              Set a different value for the <code class="literal">log-file</code>
              and <code class="literal">pid-file</code> for each agent. Agents
              must not share these values. The location of these files
              is platform-specific.
            </p></li></ul></div></div><p>
        The following section gives a general outline of the steps to
        take when altering an existing <code class="filename">ini</code> file.
        This is followed by platform-specific instructions.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="id2470869"></a>3.5.2.1. Outline of the Steps</h4></div></div></div><p>
          Assume that two MySQL servers are running on the same machine,
          one on port 3306 and another on port 3307, and that a
          MySQL Network Service Agent has already been installed to monitor the MySQL
          server on port 3306. The following steps outline the general
          procedure for installing a second agent to monitor the MySQL
          server on port 3307.
        </p><div class="orderedlist"><ol type="1"><li><p>
              Copy the <code class="filename">mysql-service-agent.ini</code> to
              <code class="filename">mysql-service-agent-3307.ini</code>.
            </p></li><li><p>
              Modify the
              <code class="filename">mysql-service-agent-3307.ini</code> file:
            </p><div class="orderedlist"><ol type="a"><li><p>
                  If applicable, reset the <code class="literal">username</code>
                  and <code class="literal">password</code> in the
                  <code class="literal">[mysqld]</code> section. For more
                  information on creating a user account for the agent
                  see, <a href="#mnmas-agent-rights" title="3.4.1. Creating a MySQL User Account for the Service Agent">Section 3.4.1, “Creating a MySQL User Account for the Service Agent”</a>.
                </p></li><li><p>
                  Change the port value in the
                  <code class="literal">[mysqld]</code> section to
                  <code class="literal">port=3307</code>.
                </p></li><li><p>
                  Change the <code class="literal">server-name</code> setting in
                  the <code class="literal">[agent]</code> section to an
                  appropriate, unique value. The hostname is the name
                  that will appear in the MySQL Network Enterprise Dashboard.
                </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
                    Note that only alphanumeric characters, periods,
                    dashes, underscores, and parentheses are legal
                    characters for this element. Hostnames must be
                    unique to specific machines. No two machines may
                    have the same hostname. If you plan to run more than
                    one agent on the same machine the hostname is
                    <span class="bold"><strong>not</strong></span> optional. For
                    more information see,
                    <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
                  </p></div></li><li><p>
                  Clear the <code class="literal">uuid = ...</code> line in the
                  <code class="literal">[agent]</code> section.
                </p><p>
                  The following, platform-specific instructions show how
                  to create a new UUID.
                </p></li><li><p>
                  Set new values for the <code class="literal">log-file</code> and
                  <code class="literal">pid-file</code> lines in the
                  <code class="literal">[agent]</code> section.
                </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
                    Set a different value for the
                    <code class="literal">log-file</code> and
                    <code class="literal">pid-file</code> for each agent. Agents
                    must not share these values. The location of these
                    files is platform-specific. For the locations of
                    these files on your platform see,
                    <a href="#mnmas-about-mysql-service-agent-ini" title="3.5.1. The mysql-service-agent.ini File">Section 3.5.1, “The <code class="filename">mysql-service-agent.ini</code> File”</a>.
                  </p></div></li></ol></div></li><li><p>
              Create an agent using the new configuration file.
            </p></li></ol></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-new-uuid-windows"></a>3.5.2.2. Generate a New UUID: Windows</h4></div></div></div><p>
          Ensure that the newly created file
          <code class="filename">mysql-service-agent-3307.ini</code>, is in the
          <code class="filename">C:\Program Files\MySQL\Network\Agent</code>
          directory.
        </p><p>
          Navigate to this directory and execute
          <span><strong class="command">mysql-service-agent -uf
          mysql-service-agent-3307.ini</strong></span>. This will generate a
          new UUID and insert it into the configuration file.
        </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
            The UUID <span class="bold"><strong>must </strong></span> be unique
            for each agent. Ensure that you do not reuse or duplicate a
            UUID. Running two agents with the same identification number
            yields unpredictable results.
          </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-creating-new-agent-windows"></a>3.5.2.3. Creating an Agent: Windows</h4></div></div></div><p>
          You now need to create a new agent using the new configuration
          file. Choose an appropriate name for the agent service. In the
          example that follows a service with the name
          <code class="literal">MySQLNetworkSeviceAgent3307</code> is created. To
          start this service go to the command line and type:
        </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc create <em class="replaceable"><code>MySQLNetworkSeviceAgent3307</code></em> binPath= "\"C:\Program »
 Files\MySQL\Network\Agent\mysql-service-agent.exe\" -f  »
 \"C:\Program Files\MySQL\Network\Agent\mysql-service-agent-3307.ini\""</code></strong>
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            Quotation marks must be escaped as indicated in the
            preceding listing. Note the space after
            <code class="literal">binPath=</code>; it is
            <span class="bold"><strong>not</strong></span> optional.
          </p></div><p>
          To start the agent skip ahead to
          <a href="#mnmas-starting-new-agent" title="3.5.2.5. Starting the New Agent">Section 3.5.2.5, “Starting the New Agent”</a>.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-new-uuid-unix-mac"></a>3.5.2.4. Generate a New UUID: Unix and Mac OS X</h4></div></div></div><p>
          In Unix go to the command line and type:
        </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>/opt/mysql/network/agent/bin/mysql-service-agent -u</code></strong>
</pre><p>
          In Mac OS X go to the command line and type:
        </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>/Applications/mysql/network/agent/bin/mysql-service-agent -u</code></strong>
</pre><p>
          This should display a line similar to the following:
        </p><pre class="programlisting">uuid = ee9296d7-f7cd-4fee-8b26-ead884ebf398
</pre><p>
          Paste this line into the <code class="literal">[agent]</code> section of
          the <code class="literal">ini</code> file.
        </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
            The UUID <span class="bold"><strong>must </strong></span> be unique
            for each agent. Ensure that you do not reuse or duplicate a
            UUID. Running two agents with the same identification number
            yields unpredictable results.
          </p></div><p>
          Save the <code class="filename">mysql-service-agent-3307.ini</code>
          file to the <code class="filename">/opt/mysql/network/agent/etc</code>
          directory on Unix systems and the
          <code class="filename">/Applications/mysql/network/agent/etc</code>
          directory on Mac OS X.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-starting-new-agent"></a>3.5.2.5. Starting the New Agent</h4></div></div></div><p>
          Once created, the agent needs to be started as a service or
          daemon. This is done by running the
          <code class="filename">mysql-service-agent</code> file specifying the
          location of the newly created <code class="filename">ini</code> file.
        </p><p>
          To start the agent under Windows see,
          <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>. To
          start up the agent automatically whenever the machine is
          rebooted go to the command line and issue the command:
        </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc config <em class="replaceable"><code>ServiceAgentName</code></em> start= auto</code></strong>
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            The space after <code class="literal">start=</code> is
            <span class="bold"><strong>not</strong></span> optional.
          </p></div><p>
          To start the agent under Unix see,
          <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>.
        </p><p>
          To start the agent under Mac OS X see,
          <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>.
        </p><p>
          Don't forget that there must be an agent account on the
          monitored server. To add one see,
          <a href="#mnmas-agent-rights" title="3.4.1. Creating a MySQL User Account for the Service Agent">Section 3.4.1, “Creating a MySQL User Account for the Service Agent”</a>.
        </p><p>
          When you are running more than one agent on the same machine
          the uninstall process is slightly different. For instructions
          on removing a specific agent, see the appropriate section of
          <a href="#mnmas-uninstall" title="Chapter 11. Uninstalling the MySQL Network Monitoring and Advisory Service">Chapter 11, <i>Uninstalling the MySQL Network Monitoring and Advisory Service</i></a>.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-install-agent-remote"></a>3.5.3. Configuring an Agent to Monitor a Remote MySQL Server</h3></div></div></div><p>
        Typically, the agent runs on the same machine as the MySQL
        server it is monitoring. Fortunately, this is not a requirement.
        If you want to monitor a MySQL server running on an operating
        system for which there is no agent available, you can install
        the agent on a machine other than the one hosting the MySQL
        server.
      </p><p>
        The process for installing an agent to monitor a MySQL server on
        a remote machine is identical to the process described in
        <a href="#mnmas-install-agent" title="3.4. Service Agent Installation">Section 3.4, “Service Agent Installation”</a>. Follow the directions
        given there, being careful to specify the correct IP address or
        host name for the MySQL Network Service Manager and likewise for the MySQL
        server — since the agent is not running on the same
        machine as the MySQL server, it cannot be the default,
        <code class="literal">localhost</code>.
      </p><p>
        Don't forget that the agent must be given rights to log in to
        the MySQL server from a host other than
        <code class="literal">localhost</code> and that the port used by the MySQL
        server, typically <code class="literal">3306</code> must be open for
        remote access. For more information about the database
        credentials required by agents see,
        <a href="#mnmas-agent-rights" title="3.4.1. Creating a MySQL User Account for the Service Agent">Section 3.4.1, “Creating a MySQL User Account for the Service Agent”</a>.
      </p><p>
        The agent also needs to be able to log in to the
        MySQL Network Service Manager, typically using port <code class="literal">18080</code>,
        so ensure that the appropriate port is open.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Monitoring a MySQL server from a remote machine affects how
          information is displayed in the Dashboard. The
          <code class="literal">OS</code> and <code class="literal">CPU</code> information
          applies to the machine on which the agent is running not the
          machine hosting the monitored server. For more information on
          this topic see, <a href="#mnmas-dashboard-overview" title="5.1.2. Overview of the Monitor Page">Section 5.1.2, “Overview of the Monitor Page”</a>.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-ssh-tunnel"></a>3.5.4. Monitoring Outside the Firewall with an SSH Tunnel</h3></div></div></div><p>
        If you run an SSH server on the machine that hosts the
        MySQL Network Service Manager, you can create an SSH tunnel so that the agent
        can bypass your firewall. First, you need to make an adjustment
        to the <code class="literal">hostname</code> value specified in the
        <code class="literal">[merlind]</code> section of the
        <code class="filename">.ini</code> file. (For more information about the
        contents and location of the <code class="literal">.ini</code> file see
        <a href="#mnmas-about-mysql-service-agent-ini" title="3.5.1. The mysql-service-agent.ini File">Section 3.5.1, “The <code class="filename">mysql-service-agent.ini</code> File”</a>.) Change
        the <code class="literal">hostname</code> value as shown in the following:
      </p><pre class="programlisting">        hostname = http://<em class="replaceable"><code>agent_name:password</code></em>@localhost:<em class="replaceable"><code>18080</code></em>/merlin/heartbeat
      </pre><p>
        Replace the <code class="literal">agent_name</code> and
        <code class="literal">password</code> with suitable values. Likewise
        replace port <code class="literal">18080</code> if you are not running the
        Dashboard on this port. Use <code class="literal">localhost</code> for the
        hostname, since the agent is connecting through an SSH tunnel.
      </p><p>
        Next, execute the following command on the machine where the
        agent is running:
      </p><pre class="programlisting">        <span><strong class="command">ssh -L <em class="replaceable"><code>18080:service_manager:18080</code></em> -l <em class="replaceable"><code>user_name</code></em> -N <em class="replaceable"><code>service_manager</code></em></strong></span>
      </pre><p>
        If you are not running the MySQL Network Service Manager on port
        <code class="literal">18080</code>, substitute the appropriate port
        number. Likewise, replace <code class="literal">service_manager</code>
        with the correct value. <code class="literal">user_name</code> represents
        a valid operating system user on the machine that hosts the
        MySQL Network Service Manager
      </p><p>
        Be sure to restart the agent so that the new value for the
        <code class="literal">hostname</code> takes effect. For instructions on
        restarting the agent see:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Under Windows see,
              <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>.
            </p></li><li><p>
              Under Unix see,
              <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>.
            </p></li><li><p>
              Under Mac OS X see,
              <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>.
            </p></li></ul></div><p>
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-troubleshooting-agent-start"></a>3.6. Troubleshooting the Agent</h2></div></div></div><p>
      The first step in troubleshooting the agent is finding out whether
      it is running or not. To do this see:

      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Windows –
            <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
          </p></li><li><p>
            Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
          </p></li><li><p>
            Mac OS X – <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
          </p></li></ul></div><p>
    </p><p>
      If incorrect credentials are specified for the agent login to the
      MySQL server that it is monitoring, then the agent will not run on
      start-up. Log in to the monitored MySQL server and check the
      agent's credentials. Compare the values of the
      <code class="literal">Host</code>, <code class="literal">User</code>, and
      <code class="literal">Password</code> fields in the
      <code class="literal">mysql.user</code> table with the values shown in the
      <code class="literal">[mysqld]</code> section of the
      <code class="filename">mysql-service-agent.ini</code>. If incorrect
      credentials are specified in the <code class="filename">ini</code> file,
      simply correct them and restart the agent. Remember, changes to
      the <code class="filename">ini</code> file do not take effect until the
      agent is restarted.
    </p><p>
      The agent will not start up if incorrect credentials are specified
      for the service manager login. Using incorrect credentials for
      logging in to the service manager creates an entry in the agent
      log file. For the location of this log file see
      <a href="#mnmas-agent-log-and-pid-files" title="A.3. Agent Log and PID Files">Section A.3, “Agent Log and PID Files”</a>.
    </p><p>
      If the agent starts up but no server appears in the Dashboard,
      check the <code class="literal">hostname</code> specified in the
      <code class="literal">[merlind]</code> portion of the
      <code class="filename">mysql-service-agent.ini</code> file. Incorrect
      credentials, IP address, or port will all cause the MySQL server
      to fail to appear in the Dashboard. Also, ensure that the port
      specified in this file is not blocked on the machine hosting the
      MySQL Network Service Manager.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        The agent will run even if the monitored server is down. To
        determine the status of the monitored server use the command:
        <span><strong class="command">mysqladmin <code class="option">ping</code></strong></span>.

        
      </p></div><p>
      An easy way to confirm that the agent can log in to the service
      manager is to type
      <strong class="userinput"><code>http://<em class="replaceable"><code>Dashboard_Host:18080</code></em>/merlin/heartbeat</code></strong>
      into the address bar of your web browser, substituting the
      appropriate hostname and port. When the HTTP authentication dialog
      box opens, enter the agent username and password. If you log in
      successfully, you should see the following message:
    </p><pre class="programlisting">&lt;exceptions&gt;
&lt;error&gt;E1031:  Agent payload parameter NULL.&lt;/error&gt;
&lt;/exceptions&gt;
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        Despite the fact that the preceding listing shows an error, you
        have logged in successfully. This error appears
        <span class="emphasis"><em>because</em></span> you have logged in but with no
        “<span class="quote">payload</span>”.
      </p></div><p>
      If you can log in successfully in the way described above, then
      there are errors in the
      <code class="filename">mysql-service-agent.ini</code> file, the agent is
      not running, or the monitored MySQL server is down.
    </p><p>
      If HTTP authentication fails then you are using incorrect
      credentials for the agent. Attempting to log in to the service
      manager using incorrect credentials creates an entry in the agent
      log file. For the location of this log file see
      <a href="#mnmas-agent-log-and-pid-files" title="A.3. Agent Log and PID Files">Section A.3, “Agent Log and PID Files”</a>.
    </p><p>
      If no HTTP authentication dialog box appears, and you are unable
      to connect at all, then you may have specified an incorrect
      hostname or port. Confirm the values you entered against those
      described as the <code class="literal">Application hostname and port:</code>
      in the <code class="filename">configuration_report.txt</code> file. Failure
      to connect could also indicate that the port is blocked on the
      machine hosting the MySQL Network Service Manager.
    </p><p>
      To check if a blocked port is the problem, temporarily bring down
      your firewall. If the agent is then able to connect, open up the
      port specified during installation and restart the agent.
    </p><p>
      You can also check the agent error log file to help determine any
      problems. An error such as the following might indicate a blocked
      port:
    </p><pre class="programlisting">(critical) connection to  merlin-server 
'http://<em class="replaceable"><code>agent:test@172.11.1.1:18080</code></em>/merlin/heartbeat' failed:
connect() timed out!" error.
</pre><p>
      For the location of the agent error log file see,
      <a href="#mnmas-agent-log-and-pid-files" title="A.3. Agent Log and PID Files">Section A.3, “Agent Log and PID Files”</a>.
    </p><p>
      Adding a <code class="literal">log-level</code> entry to your
      <code class="filename">ini</code> file is also a good debugging technique.
      For more information on this subject see,
      <a href="#mnmas-configure-log-level" title="3.5.1.3.1. Adding a log-level Entry">Section 3.5.1.3.1, “Adding a <code class="literal">log-level</code> Entry”</a>.
    </p><p>
      Running the agent from the command line will sometimes display
      errors that fail to appear in the log file or on the screen when
      the agent is started from a menu option. To start the agent from
      the command line see the instructions given at the start of this
      section.
    </p><p>
      If you have more than one agent running on the same machine, the
      <code class="literal">server-name</code> setting in the
      <code class="literal">[agent]</code> section of the <code class="filename">ini</code>
      file must be specified. Also, the <code class="literal">UUID</code> must be
      unique and the the <code class="literal">log-file</code> and
      <code class="literal">pid-file</code> values must be different. For more
      information see, <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>.
    </p><p>
      If the agent is not running on the same machine that hosts the
      MySQL server it is monitoring, then you must ensure that the
      correct <code class="literal">host</code> is specified for the agent
      account. The correct port, typically 3306, must also be open for
      remote login. For more information about remote monitoring see,
      <a href="#mnmas-install-agent-remote" title="3.5.3. Configuring an Agent to Monitor a Remote MySQL Server">Section 3.5.3, “Configuring an Agent to Monitor a Remote MySQL Server”</a>.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-unattended-installation"></a>3.7. Unattended Installation</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-command-line-options-monitoring">3.7.1. Command-Line Options</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-windows">3.7.2. Unattended Windows Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-unix-osx">3.7.3. Unattended Unix and Mac OS X Installation</a></span></dt><dt><span class="section"><a href="#mnmas-unattended-install-starting-services">3.7.4. Starting the Services</a></span></dt></dl></div><p>
      It is possible to install the MySQL Network Monitoring and Advisory Service without any direct user
      interaction. This is done by passing the command-line option
      <code class="option">--mode unattended</code> to the installation file.
    </p><p>
      Using this mode and other command-line parameters means the user
      will not be prompted for input during installation. This is
      especially useful when doing multiple installations of the
      MySQL Network Monitoring and Advisory Service.
    </p><p>
      However, rather than passing numerous parameters from the command
      line, it is usually more convenient to save your options in a text
      file and invoke the installer using the
      <code class="option">optionfile</code> option. This is a more reusable and
      less error-prone solution.
    </p><p>
      Before attempting an unattended installation, it is recommended
      that you install the MySQL Network Monitoring and Advisory Service interactively at least once. Failing
      this, as a minimum, read the regular installation instructions
      since some tasks still remain after an unattended installation;
      you must configure the MySQL Enterprise settings, import the
      advisors, and start up all the services/daemons.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-command-line-options-monitoring"></a>3.7.1. Command-Line Options</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-command-line-options-server">3.7.1.1. MySQL Network Service Manager Options</a></span></dt><dt><span class="section"><a href="#mnmas-command-line-options-service-agent">3.7.1.2. MySQL Network Service Agent Options</a></span></dt></dl></div><p>
        To view the available options for the network installer or for
        the agent installer, at the command line type the executable
        file name along with the <code class="option">help</code> option. When
        doing this under Windows you will have to redirect the output to
        a file. For example, to view the network options type:
      </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>mysqlnetwork-<em class="replaceable"><code>version</code></em>-windows-installer.exe --help &gt; help.out</code></strong>
</pre><p>
        Open the <code class="filename">help.out</code> file in a text editor to
        view the options.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-command-line-options-server"></a>3.7.1.1. MySQL Network Service Manager Options</h4></div></div></div><p>
          The following listing shows the command line options for the
          MySQL Network Service Manager.
        </p><pre class="programlisting">--help                         Display the list of valid options

--version                      Display product information

--optionfile &lt;optionfile&gt;      Installation option file

                               Default: 

--mode &lt;mode&gt;                  Installation mode

                               (Windows)Default: win32                                
                               (Unix)Default: qt
                               (Windows)Allowed: win32 unattended
                               (Unix)Allowed: qt gtk text xwindow unattended   
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            The default modes are different for different operating
            systems. The values allowed also differ. There is no
            <code class="literal">text</code> installation mode under Windows.
          </p></div><pre class="programlisting">--debugtrace &lt;debugtrace&gt;      Debug filename

                               Default: 

--installdir &lt;installdir&gt;      Installation directory

                               (Unix)Default:/opt/mysql/network/monitoring/
                               (Windows)Default:C:\Program »
                               Files\MySQL\Network\Monitoring


--tomcatport &lt;tomcatport&gt;      Tomcat Server Port

                               Default: 18080

--tomcatshutdownport &lt;tomcatshutdownport&gt; Tomcat Shutdown Port

                               Default: 18005

--tomcatsslport &lt;tomcatsslport&gt;Tomcat SSL Port

                               Default: 18443

--usessl &lt;usessl&gt;              Should communication between the Dashboard »
                                      and Service Manager be encrypted?
                               Default: 0


--adminuser &lt;adminuser&gt;        Repository Username 
                               Default: service_manager


--adminpassword &lt;adminpassword&gt;Password

                               Default: 
</pre><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
            The repository username and password are stored in
            unencrypted form in the
            <code class="filename">config.properties</code> file. You can find
            this file in the
            <code class="filename">/opt/mysql/network/monitoring/apache-tomcat/webapps/merlin</code>
            directory.
          </p></div><pre class="programlisting">
--dbport &lt;dbport&gt;              Bundled MySQL Database Port

                               Default: 13306
                               
--dbbasedir &lt;dbbasedir&gt;        Base Directory
  
                               Default: /apache-tomcat/webapps/merlin/mysql

--dbdatadir &lt;dbdatadir&gt;        Data Directory
  
                               Default: /apache-tomcat/webapps/merlin/mysql/data
                                   
                                   
</pre><p>
          The network install options are the same for all operating
          systems except as noted in the preceding listing.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-command-line-options-service-agent"></a>3.7.1.2. MySQL Network Service Agent Options</h4></div></div></div><p>
          To view all the options available for an unattended
          <span class="emphasis"><em>agent</em></span> installation, invoke the agent
          installer file passing in the <code class="option">help</code> option.
          (Under Windows you must redirect the output to a file as shown
          in <a href="#mnmas-command-line-options-monitoring" title="3.7.1. Command-Line Options">Section 3.7.1, “Command-Line Options”</a>).
          You should see a listing similar to the following:
        </p><pre class="programlisting">--help                         Display the list of valid options

--version                      Display product information
                               Default: 

--optionfile &lt;optionfile&gt;      Installation option file
                                Default: 

--mode &lt;mode&gt;                  Installation mode
                               (Windows)Default: win32 
                               (Unix)Default: qt
                               (Mac OS X)Default: osx
                               (Windows)Allowed: win32 unattended
                               (Unix)Allowed: qt gtk text xwindow unattended
                               (Mac OS X)Allowed: osx text unattended
</pre><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            The default modes are different for different operating
            systems. The values allowed also differ. There is no
            <code class="literal">text</code> installation mode under Windows.
          </p></div><pre class="programlisting"> 
--debugtrace &lt;debugtrace&gt;      Debug filename
                               Default: 

--installdir &lt;installdir&gt;      Installation directory
                               (Windows)Default: C:\Program Files\MySQL\Network\Agent
                               (Unix)Default:/opt/mysql/network/agent
                               (Mac OS X)Default:/Applications/mysql/network/agent

--mysqlhost &lt;mysqlhost&gt;         MySQL hostname or IP address
                                Default: 127.0.0.1

--checkmysqlhost &lt;checkMysqlhost&gt;Validation of MySQL hostname or IP address
                                Default: yes

--mysqlport &lt;mysqlport&gt;         MySQL port on <em class="replaceable"><code>127.0.0.1</code></em>
                                Default: 3306

--mysqluser &lt;mysqluser&gt;         Username on <em class="replaceable"><code>127.0.0.1:3306</code></em>
                                Default:

--mysqlpassword &lt;mysqlpassword&gt; Password for mysqluser on <em class="replaceable"><code>127.0.0.1:3306
</code></em>                                Default: 

--managerhost &lt;managerhost&gt;     Hostname or IP address
                                Default: 127.0.0.1

--tomcatport &lt;tomcatport&gt;       Port on <em class="replaceable"><code>127.0.0.1</code></em>
                                Default: 18080

--agentuser &lt;agentuser&gt;         Agent username on <em class="replaceable"><code>127.0.0.1:18080</code></em>
                                Default: agent

--agentpassword &lt;agentpassword&gt; Agent password for <em class="replaceable"><code>agent</code></em> on <em class="replaceable"><code>127.0.0.1:18080</code></em>
                                Default: 

--servername &lt;servername&gt;       Hostname to display
                                Default: 

</pre><p>
          Again, the agent options are the same for all operating
          systems except as noted.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-unattended-windows"></a>3.7.2. Unattended Windows Installation</h3></div></div></div><p>
        For unattended installation on Windows, create an option file
        named <code class="filename">options.server.txt</code>. The following is
        an example of what the contents of an option file might be.
      </p><pre class="programlisting">debugtrace=C:\Program Files\MySQL\Network\install.debugtrace.log
mode=unattended
installdir=C:\Program Files\MySQL\Network
tomcatport=8080
tomcatshutdownport=8005
tomcatsslport=8443
managerpassword=mymanagerpassword
adminpassword=myadminpassword
agentpassword=myagentpassword
dbport=3300
</pre><p>
        This file identifies a directory and filename for a log file,
        sets the <code class="option">mode</code> to <code class="literal">unattended</code>,
        and uses the <code class="option">installdir</code> option to specify an
        installation directory. The <code class="literal">managerpassword</code>
        is the password for logging in to the Dashboard and the
        <code class="literal">agentpassword</code> is required in order for the
        agent to communicate with the Dashboard. The
        <code class="literal">adminpassword</code> specifies the password for
        logging in to the Repository. The meaning of the other options
        is fairly self-evident.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Set the <code class="literal">installdir</code> and
          <code class="literal">debugtrace</code> options to values appropriate to
          your locale and operating system.
        </p><p>
          The only options that must be specified in an option file when
          installing the MySQL Network Service Manager are <code class="literal">mode</code> (if
          not specified at the command line),
          <code class="literal">installdir</code>, and
          <code class="literal">adminpassword</code>.

          
        </p><p>
          Check the options in your option file closely before
          installation; no warnings will be issued if there are errors.
        </p></div><p>
        Ensure that the network installer file and the options file are
        in the same directory and, if you saved the options file as
        <code class="filename">options.server.txt</code>, you can invoke an
        unattended installation from the command line by typing:
      </p><pre class="programlisting">C:\ <strong class="userinput"><code>mysqlnetwork-<em class="replaceable"><code>version</code></em>-windows-installer.exe --optionfile options.server.txt</code></strong>
</pre><p>
        You can install the MySQL Network Service Agent in exactly the same fashion.
        Create an agent option file and call the agent installer using
        the <code class="option">optionfile</code> option.
      </p><p>
        As a minimum for the agent installation, you must specify the
        <code class="literal">mode</code> (if not specified at the command line),
        <code class="literal">mysqluser</code>, <code class="literal">installdir</code>,
        <code class="literal">mysqlpassword</code>, and
        <code class="literal">agentpassword</code> options. Create a file
        containing these values and use it with the
        <code class="option">optionfile</code> option for unattended agent
        installation.
      </p><p>
        If you wish, you can create one script that calls both the
        Service Manager and the Service Agent programs passing
        appropriate <code class="option">optionfile</code> options.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-unattended-unix-osx"></a>3.7.3. Unattended Unix and Mac OS X Installation</h3></div></div></div><p>
        For unattended installation on Unix, create an option file named
        <code class="filename">options.server.txt</code>. The following is an
        example of what the contents of an option file might be for
        installation on Unix.
      </p><pre class="programlisting">debugtrace=/opt/mysql/network/install.debugtrace.network.log
mode=unattended
installdir=/opt/mysql/network/monitor
tomcatport=8080
tomcatshutdownport=8005
tomcatsslport=8443
managerpassword=mymanagerpassword
adminpassword=myadminpassword
agentpassword=myagentpassword
dbport=3300
</pre><p>
        This file identifies a directory and filename for a log file,
        sets the <code class="option">mode</code> to <code class="literal">unattended</code>,
        and uses the <code class="option">installdir</code> option to specify an
        installation directory. The <code class="literal">managerpassword</code>
        is the password for logging in to the Dashboard and the
        <code class="literal">agentpassword</code> is required in order for the
        agent to communicate with the Dashboard. The
        <code class="literal">adminpassword</code> specifies the password for
        logging in to the Repository. The meaning of the other options
        is fairly self-evident.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Set the <code class="literal">installdir</code> and
          <code class="literal">debugtrace</code> options to values appropriate to
          your locale and operating system.
        </p><p>
          The only options that must be specified in an option file when
          installing the MySQL Network Service Manager are <code class="literal">mode</code> (if
          not specified at the command line),
          <code class="literal">installdir</code>, and
          <code class="literal">adminpassword</code>.

          
        </p><p>
          Check the options in your option file closely before
          installation; no warnings will be issued if there are errors.
        </p></div><p>
        Ensure that the network installer file and the options file are
        in the same directory and, if you saved the options file as
        <code class="literal">options.server.txt</code>, you can invoke an
        unattended installation from the command line by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>mysqlnetwork-<em class="replaceable"><code>version</code></em>-installer.bin --optionfile options.server.txt</code></strong>
</pre><p>
        You can install the MySQL Network Service Agent in exactly the same fashion.
        Create an agent option file and call the agent installer using
        the <code class="option">optionfile</code> option.
      </p><p>
        As a minimum for the agent installation, you must specify the
        <code class="literal">mode</code> (if not specified at the command line),
        <code class="literal">mysqluser</code>, <code class="literal">installdir</code>,
        <code class="literal">mysqlpassword</code>, and
        <code class="literal">agentpassword</code> options. Create a file
        containing these values and use it with the
        <code class="option">optionfile</code> option for unattended agent
        installation.
      </p><p>
        If you wish, you can create one script that calls both the
        Service Manager and the Service Agent programs passing
        appropriate <code class="option">optionfile</code> options.
      </p><p>
        The procedure for unattended agent installation under Mac OS X
        is identical to the procedure under Unix.

      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Currently, only the MySQL Network Service Agent is fully supported for Mac
          OS X. At the moment the MySQL Network Service Manager is in beta for Mac OS
          X.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-unattended-install-starting-services"></a>3.7.4. Starting the Services</h3></div></div></div><p>
        Unlike an interactive installation, an unattended installation
        does not automatically start up the services or daemons. For
        instructions on starting the services needed by the
        MySQL Network Service Manager see,
        <a href="#mnmas-starting-network-services-windows" title="3.2.1.3. Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows">Section 3.2.1.3, “Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows”</a> for
        Windows and,
        <a href="#mnmas-starting-network-services-unix-osx" title="3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X">Section 3.2.2.1, “Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X”</a> for
        Unix and Mac OS X.
      </p><p>
        For instructions on starting the MySQL Network Service Agent see:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Windows –
              <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
            </p></li><li><p>
              Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
            </p></li><li><p>
              Mac OS X –
              <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
            </p></li></ul></div><p>
      </p><p>
        If you wish, you can script the startup of these services.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="post-installation"></a>3.8. Post-Installation Considerations</h2></div></div></div><p>
      Depending upon how you plan to use the MySQL Network Monitoring and Advisory Service, there are some
      tasks you may want to perform after installation. Find some
      suggestions in the following list:
    </p><div class="itemizedlist"><ul type="disc"><li><p>
          Email settings
        </p><p>
          Test email notification by deliberately triggering an alert.
        </p></li><li><p>
          Log files
        </p><p>
          Check the log files for any irregularities.
        </p></li><li><p>
          Back-up the Repository
        </p><p>
          Schedule regular back-ups.
        </p></li><li><p>
          Configuration file
        </p><p>
          Store the <code class="filename">configuration_report.txt</code> in a
          safe place. There is no mechanism for retrieving the password
          stored in this file.
        </p></li><li><p>
          Repository credentials
        </p><p>
          The repository username and password are stored in unencrypted
          form in the <code class="filename">config.properties</code> file. Take
          care to protect this file.
        </p></li><li><p>
          Disk management
        </p><p>
          Remove installation files.
        </p></li><li><p>
          Firewall changes
        </p><p>
          You may want to limit or expand access to the MySQL Network Service Manager.
        </p></li><li><p>
          Open ports
        </p><p>
          As with firewall changes, you may want to limit or expand
          access to the MySQL Network Service Manager. The dashboard uses non-standard
          ports, none of which are usually open by default.
        </p></li><li><p>
          Server upgrades
        </p><p>
          See, <a href="#mnmas-ungrading-monitored-server" title="4.1. Upgrading the Monitored MySQL Server">Section 4.1, “Upgrading the Monitored MySQL Server”</a> for
          instructions on upgrading a server.
        </p></li><li><p>
          Changes to the Repository
        </p><p>
          You may want to add other users.
        </p></li></ul></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-updating-mysql-network"></a>3.9. Updating The MySQL Network Monitoring and Advisory Service</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-unattended-update">3.9.1. Unattended MySQL Network Monitoring and Advisory Service Update</a></span></dt><dt><span class="section"><a href="#mnmas-reinstalling-mysqlnetwork">3.9.2. Reinstalling MySQL Network Monitoring and Advisory Service</a></span></dt></dl></div><p>
      From time to time MySQL Network may issue updates to the
      MySQL Network Service Manager or the MySQL Network Service Agent. This section describes how
      to perform an update for either of these components.
    </p><p>
      You cannot use the upgrade installers to upgrade to a different
      operating system or chip architecture. For example, you cannot
      upgrade a 32-bit Linux installation to a 64-bit version using an
      update installer — in cases such as this you must do a fresh
      installation.
    </p><p>
      The name of the update file varies but it shows the target
      operating system and the version the update applies to. If a
      specific component is being updated it may also appear in the file
      name. For example, a file named
      <code class="filename"><em class="replaceable"><code>mysqlnetworkmanagerjava-1.0.0-windows-update-installer.exe</code></em></code>
      would indicate a Windows update to the version of Java used with
      the MySQL Network Service Manager version 1.0.0.
    </p><p>
      You may install an update in the same way that you initially
      installed the service manager or the agent; in
      <code class="literal">win32</code> or <code class="literal">unattended</code> mode on
      Windows and in <code class="literal">qt</code>, <code class="literal">gtk</code>,
      <code class="literal">text</code>, <code class="literal">xwindow</code>, or
      <code class="literal">unattended</code> mode on Unix.

      
    </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
        Before updating the MySQL Network Service Manager stop all agents that are
        reporting to that MySQL Network Service Manager. If you are updating the
        MySQL Network Service Agent you must also stop the MySQL Network Service Manager. On a
        machine that runs more than one agent, the primary agent will
        restart when the update is complete. Any secondary agents must
        be restarted manually. To stop or start agents see:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Windows –
              <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
            </p></li><li><p>
              Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
            </p></li><li><p>
              Mac OS X –
              <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
            </p></li></ul></div><p>
      </p><p>
        The MySQL Network Service Manager version 1.2 requires agents with a version
        number of 1.2 or higher. If you are updating to version 1.2,
        please ensure that you also update the MySQL Network Service Agent. Updating
        from version 1.1.1 or earlier also eliminates the need for the
        Apache and PHP instances; they will be removed during the update
        process. If you created other applications that use these
        services, you must install Apache and PHP on your own.
      </p><p>
        <span class="emphasis"><em>NOTE</em></span>: The upgrade installer will overwrite
        <code class="filename">items-mysql-network.xml</code>. On Windows this
        file is found in the <code class="filename">C:\Program
        Files\mysql\network\agent\share\mysql-service-agent</code>
        directory and on Unix in the
        <code class="filename">/opt/mysql/network/agent/share/mysql-service-agent</code>
        directory. Back this file up if you've made any changes to it.
      </p></div><p>
      Otherwise, updating is a fairly straightforward process. Run the
      installation file and choose the directory of your current
      installation and whether or not you wish to back up your current
      installation. The time required to complete the process will vary
      depending upon the nature of the update.
    </p><p>
      If you chose to back up your current installation, a directory
      named <code class="filename">patchbackup</code> will be created in the
      current installation directory. This directory will contain copies
      of the directory or directories that were replaced during the
      update. In cases where only specific files are replaced, the
      <code class="filename">patchbackup</code> directory may contain only these
      files. If you are unhappy with the update simply overwrite the new
      files or directories with the originals found in the
      <code class="filename">patchbackup</code> directory. Be sure to stop both
      the MySQL Network Service Manager and MySQL Network Service Agent before restoring the
      original files. You can delete or archive this directory when you
      are satisfied that the update was successful.
    </p><p>
      To update your Advisors see,
      <a href="#mnmas-upgrading-updating-advisors" title="3.3.4. Upgrading and Updating Advisors">Section 3.3.4, “Upgrading and Updating Advisors”</a>.
    </p><p>
      Instructions for an unattended update follow.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-unattended-update"></a>3.9.1. Unattended MySQL Network Monitoring and Advisory Service Update</h3></div></div></div><p>
        The options available when performing an unattended update are
        as follows:
      </p><pre class="programlisting">--help                         Display the list of valid options

--version                      Display product information

--optionfile &lt;optionfile&gt;      Installation option file
                               Default: 

--mode &lt;mode&gt;                  Installation mode
                               (Windows)Default: win32
                               (Unix)Default: qt
                               (Windows)Allowed: win32 unattended
                               (Unix)Allowed: qt gtk text xwindow unattended

--debugtrace &lt;debugtrace&gt;      Debug filename
                               Default: 

--installdir &lt;installdir&gt;      Installation directory
                               Default: 

--createPatchBackup &lt;createPatchBackup&gt; Backup the current installation
                               Default: 1
</pre><p>
        The options for unattended installation of an update are the
        same for the service manager and for the agent.
      </p><p>
        If you did not install the MySQL Network Service Manager to the default
        directory the <code class="literal">installdir</code> option must be
        specified. <code class="literal">mode</code> must also be specified when
        performing an unattended update. Otherwise, performing an
        unattended update is identical to the process described in
        <a href="#mnmas-unattended-installation" title="3.7. Unattended Installation">Section 3.7, “Unattended Installation”</a>.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-reinstalling-mysqlnetwork"></a>3.9.2. Reinstalling MySQL Network Monitoring and Advisory Service</h3></div></div></div><p>
        In some cases you may want to reinstall MySQL Network Monitoring and Advisory Service rather than
        updating your current installation. To reinstall rather than
        update MySQL Network Monitoring and Advisory Service follow these steps:

        </p><div class="orderedlist"><ol type="1"><li><p>
              Stop all the Service Agents
            </p></li><li><p>
              Run the <code class="literal">uninstall</code> programs for both the
              MySQL Network Service Manager and the MySQL Network Service Agent
            </p></li><li><p>
              Begin the new installation
            </p></li></ol></div><p>
      </p><p>
        To stop the Service Agents see:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Windows –
              <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
            </p></li><li><p>
              Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
            </p></li><li><p>
              Mac OS X –
              <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
            </p></li></ul></div><p>
      </p><p>
        Instructions for removing the MySQL Network Service Manager and the
        MySQL Network Service Agent are given in <a href="#mnmas-uninstall" title="Chapter 11. Uninstalling the MySQL Network Monitoring and Advisory Service">Chapter 11, <i>Uninstalling the MySQL Network Monitoring and Advisory Service</i></a>.
      </p></div></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-changing-installation"></a>Chapter 4. Changing Your MySQL Network Monitoring and Advisory Service Installation</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-ungrading-monitored-server">4.1. Upgrading the Monitored MySQL Server</a></span></dt><dt><span class="section"><a href="#mnmas-changing-monitored-server">4.2. Changing the Server That an Agent Monitors</a></span></dt><dt><span class="section"><a href="#mnmas-suspending-agent">4.3. Temporarily Suspending the Agent</a></span></dt></dl></div><p>
    This section describes the best practices to employ when changing
    your MySQL Network Monitoring and Advisory Service installation.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-ungrading-monitored-server"></a>4.1. Upgrading the Monitored MySQL Server</h2></div></div></div><p>
      When upgrading a monitored MySQL server first
      stop the agent. To stop the agent see:
        
        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Windows – <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
            </p></li><li><p>
              Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
            </p></li><li><p>
              Mac OS X – <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
            </p></li></ul></div><p>     
        
        
      </p><p>
      
    </p><p>
      Stop the MySQL server and perform the upgrade.
      For instructions on stopping and restarting the MySQL service under Windows 
      see, <a href="#mnmas-starting-network-services-windows" title="3.2.1.3. Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows">Section 3.2.1.3, “Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows”</a>.
    </p><p>
      To stop and restart the MySQL daemon under Unix and Mac OS X, see,
      <a href="#mnmas-starting-network-services-unix-osx" title="3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X">Section 3.2.2.1, “Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X”</a>.
    </p><p>
      Once the service/daemon is stopped you may upgrade your server. 
      For instructions on upgrading
      your MySQL server see the reference manual pertaining to your
      server version. When the upgrade is complete restart the MySQL server.

      
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        The agent's log file will show that the server was down.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-changing-monitored-server"></a>4.2. Changing the Server That an Agent Monitors</h2></div></div></div><p>
      You need not reinstall the MySQL Network Service Agent in order to change the
      MySQL server that it monitors. It is possible to adapt an existing
      agent so that it monitors a different server.
    </p><p>
      To do this you must stop the service agent and then remove the
      server that it is monitoring. To stop the agent see:
      
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Windows – <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
          </p></li><li><p>
            Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
          </p></li><li><p>
            Mac OS X– <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
          </p></li></ul></div><p>     
      
      
    </p><p>
      For instructions on removing a server see,
      <a href="#mnmas-deleting-mysql-server" title="6.3.2. Removing a Server From the Dashboard">Section 6.3.2, “Removing a Server From the Dashboard”</a>.
    </p><p>
      Once the agent is stopped and the server is removed from the
      Dashboard, changes may be made to the
      <code class="filename">mysql-service-agent.ini</code> file.
    </p><p>
      Under Windows, this file is found in the <code class="filename">C:\Program
      Files\MySQL\Network\Agent</code> directory, under Unix it is
      found in the <code class="filename">/opt/mysql/network/agent/etc</code>
      directory, and under Mac OS X in the
      <code class="filename">/Applications/mysql/network/agent/etc</code>
      directory.
    </p><p>
      You will most likely want to make changes to the
      <code class="literal">[mysqld]</code> section of the
      <code class="filename">mysql-service-agent.ini</code> file. Change the
      <code class="literal">user</code>, <code class="literal">password</code>,
      <code class="literal">hostname</code>, and <code class="literal">port</code> values if
      required.
    </p><p>
      The <code class="literal">[merlind]</code> section of the
      <code class="literal">ini</code> file should <span class="emphasis"><em>not</em></span> be
      changed.
    </p><p>
      In the <code class="literal">[agent]</code>section of the
      <code class="literal">ini</code> file identify the server by an appropriate
      name. Do this by changing the value of the
      <code class="literal">server-name</code> variable. If you are going to
      retain the name of the existing log file, you may want to archive
      or delete the existing file.
    </p><p>
      To restart the agent see:
    </p><div class="itemizedlist"><ul type="disc"><li><p>
          Windows – <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
        </p></li><li><p>
          Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
        </p></li><li><p>
          Mac OS X– <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
        </p></li></ul></div><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        If you are adapting an existing agent to monitor a 
        remote server make sure that the agent has the credentials for
        remote access and that there is a port open on the 
        remote MySQL server instance. For more information see
        <a href="#mnmas-install-agent-remote" title="3.5.3. Configuring an Agent to Monitor a Remote MySQL Server">Section 3.5.3, “Configuring an Agent to Monitor a Remote MySQL Server”</a>.
      </p><p>
        If you experience difficulties starting the agent check 
        <a href="#mnmas-troubleshooting-agent-start" title="3.6. Troubleshooting the Agent">Section 3.6, “Troubleshooting the Agent”</a>.
      </p></div><p>
      Log in to the Dashboard and you should find your new server in the
      <code class="literal">All Servers</code> group.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-suspending-agent"></a>4.3. Temporarily Suspending the Agent</h2></div></div></div><p>
      In some situations you may need to bring down a monitored server.
      When this is necessary, it is good practice to stop the agent
      first—doing so will avoid generating a “<span class="quote">Server is
      unreachable</span>” event.
    </p><p>
      For instance, suppose you need to stop the server in order to do a
      backup. The steps to follow are:
    </p><div class="orderedlist"><ol type="1"><li><p>
          Stop the agent
        </p></li><li><p>
          Stop the service/daemon
        </p></li><li><p>
          Perform the backup
        </p></li><li><p>
          Restart the service/daemon
        </p></li><li><p>
          Restart the agent
        </p></li></ol></div><p>
      To stop or start the agent see:
      
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Windows – see <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
          </p></li><li><p>
            Unix – see <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
          </p></li><li><p>
            Mac OS X – see <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
          </p></li></ul></div><p>     
      
    </p><p>
      To stop the MySQL service/daemon see the MySQL reference manual
      for your server version. You can find the manual online at
      <a href="http://dev.mysql.com/doc/refman" target="_top">http://dev.mysql.com/doc/refman</a>.
    </p><p>
      Follow these steps and there will be no “<span class="quote">noise</span>”
      associated with backing up your server. In contrast, if you leave
      the agent running while bringing down the server, you will
      generate a “<span class="quote">Server is unreachable</span>” event.
    </p><p>
      As an alternative to stopping the agent, you can change the logic
      associated with a rule. For instance, you could alter the threshold 
      of the rule “<span class="quote">Server is unreachable</span>”:
    </p><pre class="programlisting">%server.reachable% == THRESHOLD
</pre><p>
      to:
    </p><pre class="programlisting">%server.reachable% == THRESHOLD  &amp;&amp; CURTIME() NOT BETWEEN '22:00:00' AND '23:00:00'
</pre><p>
      This would effectively blackout the rule between 10 and 11 pm,
      during which time you could perform a backup.
    </p><p>
      For more information about editing rules see
      <a href="#mnmas-edit-advisor" title="Figure 7.2. Edit rule screen">Figure 7.2, “Edit rule screen”</a>.
      To blackout all events associated with a specific server or group of servers see
      <a href="#mnmas-advisor-blackouts" title="7.6. Scriptable Advisor Blackout Periods">Section 7.6, “Scriptable Advisor Blackout Periods”</a>.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-exploring-monitor"></a>Chapter 5. Exploring the Monitor Screen</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-monitor-introduction">5.1. Introduction</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-opening-dashboard">5.1.1. Opening the Dashboard</a></span></dt><dt><span class="section"><a href="#mnmas-dashboard-overview">5.1.2. Overview of the Monitor Page</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-server-tree">5.2. The Server Tree</a></span></dt><dt><span class="section"><a href="#mnmas-monitor-page-graphs">5.3. The Server Graphs and Critical Events</a></span></dt><dt><span class="section"><a href="#mnmas-heat-chart">5.4. The Heat Chart</a></span></dt></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-monitor-introduction"></a>5.1. Introduction</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-opening-dashboard">5.1.1. Opening the Dashboard</a></span></dt><dt><span class="section"><a href="#mnmas-dashboard-overview">5.1.2. Overview of the Monitor Page</a></span></dt></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-opening-dashboard"></a>5.1.1. Opening the Dashboard</h3></div></div></div><p>
        Installation of the MySQL Network Monitoring and Advisory Service is now complete. Agents are
        monitoring servers and the Service Manager and Dashboard have
        been installed.
      </p><p>
        The purpose of the MySQL Network Enterprise Dashboard is to provide you with
        information about your MySQL servers. It provides a list of the
        latest MySQL Network Advisor reports, server status information,
        MySQL Enterprise alerts, and updated views of monitored MySQL
        servers. The <code class="literal">Monitor</code> screen gives a quick
        overview of the status of your MySQL servers.
      </p><p>
        Open the Dashboard by typing the hostname into the address bar
        of your web browser. If you are unsure of the host name check
        the <code class="literal">Application hostname and port</code> in the
        <code class="filename">configuration_report.txt</code> file. The default
        value is <code class="literal">http://127.0.0.1:18080/merlin/</code> but this
        login is only valid if you are logging in from the machine that
        hosts the dashboard. If you are logging in from a remote machine
        you will have to specify a value other than
        <code class="literal">127.0.0.1</code>. After logging in, select the
        <code class="literal">Monitor</code> tab.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-dashboard-overview"></a>5.1.2. Overview of the Monitor Page</h3></div></div></div><p>
        The Monitoring page provides an instant health check for all of
        the MySQL servers across the enterprise.
      </p><p>
        From this page users can:
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            View monitoring data and all critical MySQL Advisor Rule
            violations for all or selected servers.
          </p></li><li><p>
            Close and annotate MySQL Advisor Rule violations.
          </p></li><li><p>
            Quickly determine if there is a Service Agent that is not
            communicating with the Service Manager.
          </p></li><li><p>
            Quickly determine if there is a server that is in trouble or
            completely down.
          </p></li><li><p>
            View indicator value graphs for key MySQL and operating
            system (OS) level metrics. Graph presentation will default
            to a thumbnail view but will open into a larger image upon
            being clicked.
          </p></li></ul></div><p>
        The monitored server or servers are displayed in a tab on the
        left known as the <code class="literal">Server Tree</code>. Navigate to
        the various pages using the <code class="literal">Monitor</code>,
        <code class="literal">Advisors</code>, <code class="literal">Events</code>,
        <code class="literal">Graphs</code>, and <code class="literal">Settings</code> tabs.
        Depending upon your subscription level, there may also be a
        <code class="literal">Replication</code> page.
       </p><p>
        Graphs are shown in the  center of the page beneath the tabs. 
        If applicable, you'll also find a list of critical events.
      </p><p>
        On the right is the color-coded <code class="literal">Heat Chart</code>,
        showing the advisors that are installed by default. The
        <code class="literal">Heat Chart</code> shows the most important advisors,
        allowing a quick overview of the state of your servers. You may
        open the <code class="literal">Heat Chart</code> in its own window by
        clicking the <code class="literal">Standalone Heat Chart</code> link.
        If applicable, you'll also find a list of critical events.
      </p><p>
        The <code class="literal">Show/Hide Legend</code> link toggles display of
        the key to the icons used in the <code class="literal">Heat Chart</code>.
      </p><p>
        If a specific server is selected in the <code class="literal">Server
        Tree</code> details about this server are shown beneath the
        legend in the <code class="literal">Meta Info</code> area. The information
        shown in this area is the hostname, the MySQL version number,
        the number of scheduled rules, the operating system, and the
        CPU.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          In the case of remote monitoring, the agent runs on a
          different machine than the MySQL server that it is monitoring.
          The <code class="literal">Hostname</code>, <code class="literal">MySQL</code>, and
          <code class="literal">Rules</code> information applies to the system
          being monitored. The <code class="literal">OS</code> and
          <code class="literal">CPU</code> information applies to the machine on
          which the agent is running. For more information about remote
          monitoring see, <a href="#mnmas-install-agent-remote" title="3.5.3. Configuring an Agent to Monitor a Remote MySQL Server">Section 3.5.3, “Configuring an Agent to Monitor a Remote MySQL Server”</a>.
        </p></div><p>
        The top of the screen shows the refresh cycle and
        <code class="literal">Help</code> and <code class="literal">Log Out</code> links.
        Click the <code class="literal">Help</code> link to open the documentation
        in a separate browser window. Choose <code class="literal">Log Out</code>
        if you wish to leave the Dashboard or to log in as a different
        user. Different refresh rates are available from the drop-down
        listbox.
      </p><p>
        In the footer are external links to 
        MySQL Enterprise and information about the current user. 
        Users can remain connected to the Dashboard and update their
        subscription, use the Enterprise Knowledge Base, and contact technical
        support. Your subscription information is also displayed here,
        showing the number of days remaining and the number of licenses.
        The number of licenses indicates to the number of 
        machines that may be monitored; any number of MySQL servers may be running 
        on a specific machine.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-server-tree"></a>5.2. The Server Tree</h2></div></div></div><p>
      The tab on the left displays the Server tree. By default the first
      group of servers is selected. This selection determines the
      information shown on the <code class="literal">Monitor</code> page.
    </p><p>
      If a server group is selected, the information presented on the
      <code class="literal">Monitor</code> page is aggregate information for this
      group; if only one server is selected the information applies to
      that server only.
    </p><p>
      Change your server selection and the information shown in the
      graphs and in the <code class="literal">Heat Chart</code> changes.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        For more information about server groups see,
        <a href="#mnmas-server-grouping" title="6.3.1. Grouping Servers">Section 6.3.1, “Grouping Servers”</a>.
      </p></div><p>
      The individual server, or server group, selected in the Server
      Tree also determines what information appears when the
      <code class="literal">Advisors</code> tab or the <code class="literal">Events</code>
      tab is selected.
    </p><p>
      The Server Tree presents an easy way to navigate to different
      groups or to specific servers.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-monitor-page-graphs"></a>5.3. The Server Graphs and Critical Events</h2></div></div></div><p>
      The center of the <code class="literal">Monitor</code> page gives a visual
      representation of the state of your servers.
    </p><div class="figure"><a name="mnmas-server-graphs"></a><p class="title"><b>Figure 5.1. The Graphs screen</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/server-graphs.png" alt="The Graphs screen"></div></div><p>
      The graphs present information about the currently selected server
      or server group. The default graphs show the hit ratios, CPU
      utilization, connections, and database activity for a specific
      interval. 
    </p><p>
      To set the interval click the
      <code class="literal">configure graphs</code> link immediately below the
      graphs. This opens a dialog box where you can choose the default
      interval for the x-axis of the graphs. Defining a shorter or longer
      interval gives you a shorter or longer term view of server activity.
      The thumbnail and full-size graph dimensions can also be adjusted 
      from this dialog box. Save any changes that you have made and the
      values chosen will be the defaults whenever you log in.      
    </p><p>
      You can also choose the default graphs shown on the 
      <code class="literal">Monitor</code> page. To do this click the
      <code class="literal">edit favorites</code> link and choose 
      the graphs you want from the drop-down list box.
      To choose contiguous graphs, hold down the 
      <span><strong class="keycap">Shift</strong></span> key and click on the desired graphs.
      For a non-contiguous selection, click the desired graphs
      while holding down the <span><strong class="keycap">Ctrl</strong></span>
      key. The maximum number of graphs that can be displayed
      on the <code class="literal">Monitor</code> page is six.
      Save your changes and these will be the default graphs
      whenever you log in.
      
    </p><p>
      Color coding helps distinguish different aspects of each graph.
      With <code class="literal">Database Activity</code> for example, you can
      readily distinguish <code class="literal">SELECT</code> statements from
      database insertions.
    </p><p>
      Clicking a graph opens a detailed view with  
      <span class="guilabel">Graph Display</span> and <span class="guilabel">Configure</span>
      tabs.
      Choose the <code class="literal">Configure</code> tab to temporarily
      change the way that a graph displays.
      Changes made from this
      tab only apply to the standalone graph while it is open. 
      Persistent changes are made as described above.
    </p><p><a name="mnmas-graph-interval"></a>
      Dismiss the enlarged graph by clicking the
      <span class="guibutton">hide</span> button.
    </p><p>
      <code class="literal">Critical</code> alerts appear on this page immediately
      below the graphs–quickly attracting your attention. For a
      description of all the different alarm levels see,
      <a href="#mnmas-heat-chart" title="5.4. The Heat Chart">Section 5.4, “The Heat Chart”</a>. This is the subject of discussion in
      <a href="#mnmas-events" title="Chapter 8. Monitoring and Responding to Advisor Events">Chapter 8, <i>Monitoring and Responding to Advisor Events</i></a>.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-heat-chart"></a>5.4. The Heat Chart</h2></div></div></div><p>
      Whenever a new agent contacts the Service Manager for the first
      time, all the rules in the Heat Chart Advisor are automatically
      activated. These Advisors monitor the status of the server and
      agent, critical operating system indicators, and important events
      related to your MySQL servers. An example follows.
    </p><div class="figure"><a name="id2475141"></a><p class="title"><b>Figure 5.2. The Heat Chart</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/heat-chart.png" alt="The Heat Chart"></div></div><p>
      To interpret the Heat Chart see the following legend.
    </p><div class="figure"><a name="id2475178"></a><p class="title"><b>Figure 5.3. The Heat Chart legend</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/heat-chart-legend.png" alt="The Heat Chart legend"></div></div><p>
      In this particular case, the <code class="literal">Heat Chart</code> tells
      us that table scans on the MySQL server labeled
      <code class="literal">PROD2:3307</code> have reached a critical level, as
      have table scans on a number of other servers. For all the servers
      there is a total of 29 critical alerts, 55 warnings, and 33
      informational alarms.
    </p><p>
      You may open the Heat Chart in its own browser window by clicking
      the <code class="literal">Standalone Heat Chart</code> link immediately
      below the <code class="literal">Heat Chart</code> on the left. If you like,
      the refresh rate can be set to a different rate than the setting
      on the <code class="literal">Monitor</code> page.
    </p><p>
      In addition to showing the most important advisors, the
      <code class="literal">Heat Chart</code> also has columns that display the
      number of critical, warning, and informational alarms. Clicking
      the hyperlink in any one of these columns takes you to the
      <code class="literal">Event</code> screen, which gives more detailed
      information. For more information about events see,
      <a href="#mnmas-events" title="Chapter 8. Monitoring and Responding to Advisor Events">Chapter 8, <i>Monitoring and Responding to Advisor Events</i></a>.
    </p><p>
      When the Dashboard is first installed no notification groups are
      associated with the Advisors shown in the Heat Chart. For more
      information on this topic see,
      <a href="#mnmas-advisor-installation-after-login" title="3.3.3. Installing Advisors After Initial Log-in">Section 3.3.3, “Installing Advisors After Initial Log-in”</a> and,
      <a href="#mnmas-notification-groups" title="6.5. Notification Groups">Section 6.5, “Notification Groups”</a>.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-configuring-dashboard-settings"></a>Chapter 6. Configuration Settings</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-global-preferences">6.1. Global Preferences</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-snmp-traps">6.1.1. SNMP Traps</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-user-preferences">6.2. User Preferences</a></span></dt><dt><span class="section"><a href="#mnmas-managing-servers">6.3. Managing Servers</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-server-grouping">6.3.1. Grouping Servers</a></span></dt><dt><span class="section"><a href="#mnmas-deleting-mysql-server">6.3.2. Removing a Server From the Dashboard</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-managing-users">6.4. Managing Users</a></span></dt><dt><span class="section"><a href="#mnmas-notification-groups">6.5. Notification Groups</a></span></dt><dt><span class="section"><a href="#mnmas-logs">6.6. Logs</a></span></dt></dl></div><p>
      Upon initial installation you may have configured
      your MySQL Enterprise credentials and also outgoing
      email settings. This section explores the
      configuration settings in more detail, and 
      also shows how to manage servers, users, notification groups, 
      Simple Network Management Protocol (SNMP) traps, and log files.
    </p><p>
      Knowledge of server management is a prerequisite for properly configuring
      advisors — the subject of <a href="#mnmas-advisors" title="Chapter 7. The Service Advisors">Chapter 7, <i>The Service Advisors</i></a>.
    </p><p>
      To get to the <code class="literal">Settings</code> page open the Dashboard and choose the 
      <code class="literal">Settings</code> tab.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-global-preferences"></a>6.1. Global Preferences</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-snmp-traps">6.1.1. SNMP Traps</a></span></dt></dl></div><p>
        The <code class="literal">Global Preferences</code> page was introduced
        earlier because installation of the advisors usually requires
        configuring your MySQL Enterprise credentials. If you wish to
        change these credentials use the text boxes in the <code class="literal">MySQL Enterprise
         Credentials</code> section.   
        For security purposes, the MySQL Enterprise account
        password is not displayed while editing. Only populate the
        MySQL Enterprise account information if you are changing the
        account information.
      </p><p>
        You may also enter your <code class="literal">MySQL Enterprise Product Key</code>.
        If you do not have access to the Internet from the Dashboard,
        this provides an alternate way to update or activate the
        MySQL Network Monitoring and Advisory Service.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Only administrators can change the
          <code class="literal">MySQL Enterprise Credentials</code> section or
          enter a product key.
          These sections will not appear if a <code class="literal">DBA</code>
          user is logged in. For more information about different users
          and their rights see <a href="#mnmas-managing-users" title="6.4. Managing Users">Section 6.4, “Managing Users”</a>.
          Specifying incorrect credentials results in the
          error message, “<span class="quote">Your credentials do not appear to
          be valid.</span>”
        </p></div><p>
        You may also have already configured outgoing email settings. 
        For more information about
        <code class="literal">Outgoing Email Settings</code> see,
        <a href="#mnmas-outgoing-email-settings" title="3.3.5. Outgoing Email Settings">Section 3.3.5, “Outgoing Email Settings”</a>.
      </p><p>
        The <code class="literal">Data Purge Behavior</code> section of the
        <code class="literal">Global Preferences</code> page lets you remove old
        log files and also old data from the Repository. The default for
        this behavior is set to <code class="literal">4 weeks</code>. If you wish to
        purge data, change this setting by choosing from the drop-down
        list. Choosing <code class="literal">52 weeks</code>, for example, will
        remove all data that is older than a year.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          Purging data will permanently remove information from the
          repository. Since events are derived from data contained in
          the repository, they will be purged along with the data.
        </p></div><p>
        You may also purge the log files by choosing a time period from
        the associated drop-down list.
      </p><p>
        The <code class="literal">Global Preferences</code> page also has a
        <code class="literal">Remote Server Inventory Schedule</code> section. The
        MySQL Network Monitoring and Advisory Service keeps track of all the databases and tables in a
        server, as well as the amount of RAM, disk space, and other
        items. A re-inventory updates this information in case you've
        added or dropped databases and tables. Depending upon the
        configuration of your system, this operation can tax resources.
        If you are monitoring many remote servers this is an operation
        you may want to perform in off-peak hours only.
      </p><p>
        This page also contains Enterprise Dashboard Server information;
        the version number, uptime, and other information related to the 
        Java Virtual Machine.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-snmp-traps"></a>6.1.1. SNMP Traps</h3></div></div></div><p>
        The <code class="literal">SNMP Traps</code> section of the <code class="literal">Global 
         Preferences </code> page allows you to enable
        Simple Network Management Protocol so that your Network
        Management System (NMS) can handle events created by the 
        MySQL Network Monitoring and Advisory Service. Configure this section to route alerts and notifications to standard
        SNMP-enabled nodes on your network.
      </p><p>
        In the <span class="guilabel">target</span> text box enter the IP address
        or the host name of your NMS listener. The port number defaults
        to the well-known SNMP port, <code class="literal">162</code>. If you are
        not using this port, enter the port that your Network Management
        System is listening on.
      </p><p>
        Enter the appropriate community string in the 
        <code class="literal">Community String</code> text box. The default
        value for this string is <code class="literal">public</code>.
      </p><p>
        To ensure that the target you have specified is valid, check the
        <code class="literal">On Save, Send Test Trap</code> check box. The
        remaining check boxes help you to configure how your NMS
        responds to MySQL Network Monitoring and Advisory Service. Check the <span class="guilabel">Up/Down
        Application</span> check box to configure NMS for starting
        up or shutting down the MySQL Network Monitoring and Advisory Service. For configuration of advisor
        events choose a level of severity and check the
        <span class="guilabel">Advisor event with the severity of
        <em class="replaceable"><code>Critical</code></em></span> check box.
        Finally, choose the <span class="guilabel">Application Error</span> check
        box to configure NMS to support application error traps.
        Be sure to save your settings before exiting.
      </p><p>
        If you wish to enable SNMP traps globally, check the
        <code class="literal">Enable SNMP Notifications</code> checkbox.
        To enable SNMP traps only for specific rules run against
        specific servers or server groups leave this
        checkbox unchecked — enabling specific SNMP
        traps is done as rules are scheduled.
        For instructions on doing this see <a href="#mnmas-scheduling-advisors" title="7.2. Scheduling Advisors">Section 7.2, “Scheduling Advisors”</a>.
      </p><p>
        The Management Information Base (MIB) file associated with
        SNMP trapping is called <code class="filename">MNMAS.MIB</code>. For the location 
        this file see <a href="#mnmas-mib-file-location" title="A.4. The Management Information Base (MIB) File">Section A.4, “The Management Information Base (MIB) File”</a>.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-user-preferences"></a>6.2. User Preferences</h2></div></div></div><p>        
        On this page users can change their passwords, usernames,
        and locale information.
      </p><p>
        Change your password by entering a new
        value into the <span class="guilabel">Password</span> text box. 
        To change your username enter a new value into 
        the <span class="guilabel">Username</span> text box. 
        Click
        the <span class="guibutton">save user properties</span> button to commit this
        change.
      </p><p>
        You may also adjust your time zone and locale information from this page.
        The settings on this page apply only to the user
        who is currently logged in.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          Be sure to set the correct time zone so that alerts
          are time stamped correctly.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-managing-servers"></a>6.3. Managing Servers</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-server-grouping">6.3.1. Grouping Servers</a></span></dt><dt><span class="section"><a href="#mnmas-deleting-mysql-server">6.3.2. Removing a Server From the Dashboard</a></span></dt></dl></div><p>
          To help with server management, the Service Manager supports
          the logical grouping of MySQL servers. This allows you to
          group servers in any fashion you choose. For example, you can
          manage servers according to purpose. You can group servers by
          whether the servers handle Internet or intranet data, by
          whether they power finance or HR applications, or, if you
          prefer, you may organize them by physical location rather than
          by functionality.
        </p><p>
          For a server to appear in the Dashboard there must be an agent
          monitoring it. If you wish to add a server to the Dashboard
          follow the procedure for installing an agent found at
          <a href="#mnmas-install-agent" title="3.4. Service Agent Installation">Section 3.4, “Service Agent Installation”</a>. Instructions for adding a
          remote server are found at
          <a href="#mnmas-install-agent-remote" title="3.5.3. Configuring an Agent to Monitor a Remote MySQL Server">Section 3.5.3, “Configuring an Agent to Monitor a Remote MySQL Server”</a>.
        </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            The <code class="literal">All Servers</code> group is built in and
            every monitored server is a member of this group.
          </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-server-grouping"></a>6.3.1. Grouping Servers</h3></div></div></div><p>
          All monitored servers are automatically included in the
          top level server grouping, <code class="literal">All Servers</code>.
          Other server groupings are replication groups or user-defined 
          groups.
        </p><p>
          You can create a user-defined group by clicking on the <code class="literal">Manage
          Servers</code> link. Add a group name and then click the
          <span class="guibutton">create group</span> button. The new group will
          be displayed immediately.
        </p><p>
          Replication groups are automatically discovered
          by MySQL Network Monitoring and Advisory Service and in this respect differ from
          user-defined groups. For more information
          about replication groups see <a href="#mnmas-replication" title="Chapter 10. The Replication Page">Chapter 10, <i>The Replication Page</i></a>.
          However, like user-defined groups you can edit
          the name of a replication group and add other servers to it.
        </p><p>
          To add to a group, select the <code class="literal">add to group</code>
          link. Choose the server or servers you wish to add and then
          complete the operation by choosing the <span class="guibutton">add to
          group</span> button. You can add a server to a group
          even if the agent is down.
        </p><p>
          To remove a server from a group expand the server group tree
          and click the <code class="literal">remove from group</code> link. To
          delete a server altogether see
          <a href="#mnmas-deleting-mysql-server" title="6.3.2. Removing a Server From the Dashboard">Section 6.3.2, “Removing a Server From the Dashboard”</a>.
          <span class="emphasis"><em>Note</em></span>: Slaves removed from a replication
          group will be rediscovered and re-added to that group.
        </p><p>
          There are three ways to modify an existing group; by renaming
          it, adding to it, or removing it. Select the
          <code class="literal">rename</code> link to change the name of a group
          and <code class="literal">add to group</code> to add additional servers.
          Deleting a group simply requires clicking the <code class="literal">remove
          all from group</code> link. This removes the server group
          but has no effect on individual servers.
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-deleting-mysql-server"></a>6.3.2. Removing a Server From the Dashboard</h3></div></div></div><p>
          If you no longer wish to monitor a MySQL server you can remove
          it from the Dashboard. There is no provision for deleting an
          active server from the Dashboard—to remove a server you
          must make it inactive by stopping the agent.
        </p><p>
          For instructions on stopping an agent see:

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                Windows – <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>
              </p></li><li><p>
                Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
              </p></li><li><p>
                Mac OS X – <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
              </p></li></ul></div><p>
        </p><p>
          Once the agent is stopped you may delete the monitored server.
          Deleting a server simply means that it will no longer show up
          in the Dashboard.
        </p><p>
          Remove a server by choosing the <code class="literal">Settings</code>
          tab and then the <code class="literal">Manage Servers</code> link. Find
          the server you wish to remove and delete it by clicking the
          <code class="literal">delete</code> link. Deleting a server from the
          <code class="literal">All Servers</code> group or from any other group
          will remove it from the Dashboard entirely.
        </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
            A <code class="literal">delete</code> link will not appear beside an
            active server. You must stop the agent before this link will
            appear.
          </p><p>
            You may remove a server from any group at any time.
          </p></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-managing-users"></a>6.4. Managing Users</h2></div></div></div><p>
        To log in to the Dashboard a user account is required. There are
        three types of users with varying privileges; Administrators,
        Database Administrators, and Agents. The
        <code class="literal">Administrator</code> can create additional users and
        differs from a <code class="literal">DBA</code> in this respect.
        For this reason the <code class="literal">Manage Users</code> 
        does not display if a DBA user logs in.
        Additionally, only administrators can change the MySQL Enterprise Credentials section 
        or enter a product key on the <code class="literal">Global Settings</code>
        page. These sections do not appear when DBA users log in.
        For more information on this subject see <a href="#mnmas-global-preferences" title="6.1. Global Preferences">Section 6.1, “Global Preferences”</a>.
        The <code class="literal">Agent</code> account simply allows the
        MySQL Network Service Agent to communicate with the Dashboard. There is no
        need for more than one agent account but defining an account for
        each server that is monitored can be an advantage since this
        minimizes exposure should any one agent be compromised.
        You cannot log in to the Dashboard using the agent's credentials.
      </p><p>
        When the Dashboard is first launched there are two default
        users, <code class="literal">Administrator</code> and an
        <code class="literal">Agent</code>, both created during installation.
        Their default usernames are respectively, <code class="literal">admin</code> and 
        <code class="literal">agent</code>.
        The Administrator defined during installation as having the root
        role is unique; this user cannot be deleted.
      </p><p>
        If you are logged in as an <code class="literal">Administrator</code>, you
        can add a new user by choosing the <code class="literal">Manage Users</code>
        link from the <code class="literal">Settings</code> page. 
        To create a user click the <span class="guibutton">create
        user</span> button, select a role for the user, and enter a
        username and password. 
      </p><p>
        When a new user first logs in, a dialog box opens requesting 
        time zone and locale information. This information may be changed
        later from the <code class="literal">User Preferences</code> page. For more information
        see, <a href="#mnmas-user-preferences" title="6.2. User Preferences">Section 6.2, “User Preferences”</a>.
      </p><p>
        If you installed the Advisors through the Dashboard you should
        have already configured the settings for the root role user.
        (See, <a href="#mnmas-global-preferences" title="6.1. Global Preferences">Section 6.1, “Global Preferences”</a> and following for
        more information about this topic.)
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          To receive MySQL Enterprise and Advisor updates configure
          the MySQL Enterprise settings for at least one user. The
          MySQL Enterprise settings were set up on the first login to the
          Dashboard. For information on changing these settings see,
          <a href="#mnmas-global-preferences" title="6.1. Global Preferences">Section 6.1, “Global Preferences”</a>.
        </p></div><p>
        To edit an existing user's information, select the
        <code class="literal">Manage Users</code> link, then select the user you
        wish to edit. Make your desired changes in the fields provided
        and then save your changes.
      </p><p>
        To delete an existing user, merely select the
        <code class="literal">delete</code> link.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-notification-groups"></a>6.5. Notification Groups</h2></div></div></div><p>
        Notification groups are collections of users who should be
        notified when advisor alerts occur. These users may have login
        credentials for the Dashboard but this is not a requirement.
      </p><p>
        You can create a group by clicking on the <code class="literal">create
        group</code> link. Specify a group name and add recipients.
        When adding a user an email address must be specified. If you
        are adding multiple users separate them with commas.
      </p><p>
        To modify an existing notification group, select the
        <code class="literal">edit</code> link next to the group name. Deleting a
        group simply requires clicking the <code class="literal">delete</code>
        link.
      </p><p>
        If a rule triggers an alarm, an email will be sent to the
        members of the notification group specified when the rule was
        scheduled. For more information about scheduling rules see
        <a href="#mnmas-scheduling-advisors" title="7.2. Scheduling Advisors">Section 7.2, “Scheduling Advisors”</a>.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          You should ensure that there is a mail server available for
          sending out alerts and that there is an account configured for
          receiving any alerts that are created.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-logs"></a>6.6. Logs</h2></div></div></div><p>
        Use the <code class="literal">Logs</code> link to inspect the various log
        files associated with the MySQL Network Service Manager. The following image
        is an example of this screen.
      </p><div class="figure"><a name="mnmas-logs-screen"></a><p class="title"><b>Figure 6.1. Logs screen</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/logs-screen.png" alt="Logs screen"></div></div><p>
        The various categories of alerts are shown in alphabetical
        order. The most recent changes to rules or notification groups
        are shown in the <span class="guilabel">Last Modified</span> column. This
        column will tell you which advisors have been updated recently.
        The number of entries in any specific log is shown under the
        <span class="guilabel">Entries</span> column.
      </p><p>
        To view detailed information click the <code class="literal">Log
        Name</code>. This will open a separate browser window showing
        the date, time, alert type, and accompanying message.
      </p><p>
        On this screen you can filter log information in a couple of
        ways; by the message type and by time period .
      </p><p>
        To filter by message type select from the options in the
        <span class="guilabel">level</span> drop-down box. These are, in order of
        decreasing severity:
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            All
          </p></li><li><p>
            Error
          </p></li><li><p>
            Warning
          </p></li><li><p>
            Information
          </p></li><li><p>
            Trace
          </p></li><li><p>
            Debug
          </p></li></ul></div><p>
        You can also adjust the number of items that appear on each
        page.
      </p><p>
        Press the <code class="literal">clear all logs</code> link to remove all
        log entries. To remove entries of a specific kind click the
        <code class="literal">clear logs</code> link associated with the specific
        log you would like to remove. A confirmation dialog box allows
        you to back out of this operation and avoid accidentally
        removing log information.
      </p><p>
        To clear log files of a specific age see the <code class="literal">Data Purge
        Behavior</code> section of the <code class="literal">Global
        Preferences</code> page. For more information see
        <a href="#mnmas-global-preferences" title="6.1. Global Preferences">Section 6.1, “Global Preferences”</a>.
      </p><p>
        Use the <code class="literal">edit log level</code> link to change the
        type of error logged. The value selected from the <code class="literal">Edit
        Log Level</code> dialog box determines what appears under the
        <span class="guilabel">Threshold</span> column (second from the left in
        <a href="#mnmas-logs-screen" title="Figure 6.1. Logs screen">Figure 6.1, “Logs screen”</a>).
      </p><p>
        Selecting <code class="literal">Error</code> from the list box will create
        the least number of log entries and <code class="literal">Debug</code> the
        most. Choosing <code class="literal">None</code> turns off logging
        altogether.
      </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-advisors"></a>Chapter 7. The Service Advisors</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-update-advisors">7.1. Installing and Updating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-scheduling-advisors">7.2. Scheduling Advisors</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-heat-chart-notifications">7.2.1. Heat Chart Notifications</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-editing-built-in-rules">7.3. Editing Built-in Rules</a></span></dt><dt><span class="section"><a href="#mnmas-creating-advisors-and-rules">7.4. Creating Advisors and Rules</a></span></dt><dd><dl><dt><span class="section"><a href="#mnmas-creating-advisors">7.4.1. Creating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-creating-rules-overview">7.4.2. Overview of Rule Creation</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-variables">7.4.3. Variables</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-thresholds">7.4.4. Thresholds</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-using-strings">7.4.5. Using Strings</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-wiki-format">7.4.6. Wiki Format</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-unscheduling-advisors">7.5. Disabling and Unscheduling Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-advisor-blackouts">7.6. Scriptable Advisor Blackout Periods</a></span></dt></dl></div><p>
    MySQL Network Advisors are a series of scripts that gather information
    from your MySQL servers via the Service Manager and the Service
    Agents, analyze that information based on custom rules developed by
    MySQL AB, and then offer alerts and advice when necessary. As new
    rules are introduced, the MySQL Network Advisors can be updated through the
    MySQL Enterprise website.
  </p><p>
    The MySQL Enterprise Advisors fall into the following categories:
  </p><div class="itemizedlist"><ul type="disc"><li><p>
        Administration
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Better manage databases
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Suggest improvements for smoother operation
          </p></li></ul></div></li><li><p>
        Heat Chart
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Drive the status indicators in the Heat Chart
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Identify up/down status and performance issues
          </p></li></ul></div></li><li><p>
        Performance
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Identify potential performance bottlenecks
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Make suggestions for improved database speed
          </p></li></ul></div></li><li><p>
        Replication
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Identify replication bottlenecks
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Improve replication design
          </p></li></ul></div></li><li><p>
        Schema
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Identify schema changes
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Find security loopholes
          </p></li></ul></div></li><li><p>
        Security
      </p><div class="itemizedlist"><ul type="circle"><li><p>
            Protect MySQL servers
          </p></li></ul></div><div class="itemizedlist"><ul type="circle"><li><p>
            Find security loopholes
          </p></li></ul></div></li></ul></div><p>
    An advisor category provides a set of rules designed to enforce
    MySQL best practices for that specific category. Rules can be
    targeted to run at the individual server or group level and, upon
    rule violation, provide alerts and expert advice on how to address
    and correct a problem before it becomes a costly outage.
  </p><p>
    Individual rules are defined in the
    <code class="filename">items-mysql-network.xml</code> file. On Windows this
    file is found in the <code class="filename">C:\Program
    Files\mysql\network\agent\share\mysql-service-agent</code>
    directory and on Unix in the
    <code class="filename">/opt/mysql/network/agent/share/mysql-service-agent</code>
    directory. Find below the rule for discovering a
    <code class="literal">root</code> account with no password.
  </p><pre class="programlisting">&lt;ITEM&gt;
  &lt;NAME&gt;no_root_password&lt;/NAME&gt;
  &lt;FIELD&gt;no_password&lt;/FIELD&gt;
  &lt;SCOPE&gt;table&lt;/SCOPE&gt;
  &lt;CODE&gt;
    &lt;![CDATA[SELECT COUNT(*) AS no_password FROM mysql.user WHERE user='root' AND password='']]&gt;
  &lt;/CODE&gt;  
  &lt;NAMESPACE&gt;mysql&lt;/NAMESPACE&gt;
  &lt;RETURNS&gt;INTEGER&lt;/RETURNS&gt;  
  &lt;SOURCE&gt;table&lt;/SOURCE&gt;
  &lt;INSTANCE&gt;mysql.user&lt;/INSTANCE&gt;  
&lt;/ITEM&gt;
</pre><p>
    Your MySQL Enterprise subscription level determines which rules
    are available to you. Subscription levels are cumulative,
    meaning that higher MySQL Enterprise levels have access to all the
    rules of the lower levels.
  </p><p>
    When the Dashboard is first installed, the only rules that are
    scheduled are those that belong to the <code class="literal">Heat Chart</code>
    group.
  </p><p>
    Go to the Advisors screen by logging in to the Dashboard and
    choosing the <code class="literal">Advisors</code> tab.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-update-advisors"></a>7.1. Installing and Updating Advisors</h2></div></div></div><p>
      Instructions for installing Advisors are given in
      <a href="#mnmas-advisor-installation-after-login" title="3.3.3. Installing Advisors After Initial Log-in">Section 3.3.3, “Installing Advisors After Initial Log-in”</a>, and
      following. Principally, you need to configure your
      MySQL Enterprise login or enter your product key before you can
      update your Advisors.
    </p><p>
      If your MySQL Enterprise login is configured, you can download
      the latest Advisors by navigating to the
      <code class="literal">Advisors</code> page and finding the <code class="literal">Check
      for Updates</code> link. You can periodically update advisors
      in this way.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        If you do not have Internet access and cannot use the online
        update option you can manually import advisors. This process is
        described in <a href="#mnmas-advisor-installation-after-login" title="3.3.3. Installing Advisors After Initial Log-in">Section 3.3.3, “Installing Advisors After Initial Log-in”</a>.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-scheduling-advisors"></a>7.2. Scheduling Advisors</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-heat-chart-notifications">7.2.1. Heat Chart Notifications</a></span></dt></dl></div><p>
      Once the MySQL Network Advisors have been installed, you can configure
      which advisors you would like to run on a scheduled basis.
    </p><p>
      You can schedule advisors by individual server or by group. This
      is done by first selecting the desired server or server group from
      the <code class="literal">Server</code> tree found on the left side of the
      screen. Next select the <code class="literal">Advisors</code> tab.
    </p><p>
      Opening the <code class="literal">Advisors</code> tab takes you to the
      <code class="literal">Current Schedule</code> page. If you have only just
      installed the MySQL Network Monitoring and Advisory Service then you will only see the <code class="literal">Heat
      Chart</code> group of advisors. Clicking the
      <span class="guibutton">+</span> button will show all the rules in the
      Heat Chart group.
    </p><p>
      Clicking the <span class="guibutton">+</span> button beside any specific
      rule will show the servers that this rule is running on, its
      frequency, and its status. Initially, all the <code class="literal">Heat
      Chart</code> rules are enabled.
    </p><p>
      For a more complete description of a rule, click the rule's name.
      This opens a dialog box that gives detailed information about the
      rule.
    </p><p>
      To view the advisors other than the Heat Chart group, select the
      <code class="literal">Add to Schedule</code> link. This will show all the
      advisors available for your subscription level.
    </p><p>
      Rules are grouped by functionality and displayed in alphabetic
      order. To expand a group click the <span class="guibutton">+</span> button
      to the left of the advisor name.

      
    </p><p>
      You may activate all the rules in a group by selecting the
      checkbox beside the group name. Once selected you may apply rules
      against a specific server or a group of servers. A message showing
      the group of servers or the specific server you have selected will
      display immediately below the <span class="guibutton">schedule</span>
      button. For example, if the <code class="literal">All Servers</code> group
      is selected in the server tree, then the message will read,
      “<span class="quote">Schedule Advisors Against <span class="bold"><strong>All
      Servers</strong></span></span>”.
    </p><p>
      To select a specific rule, expand the group tree by clicking the
      <span class="guibutton">+</span> button. Select the checkbox to the left
      of the rule you wish to schedule. Click
      <span class="guibutton">schedule</span> to display the following dialog
      box:
    </p><div class="figure"><a name="id2477053"></a><p class="title"><b>Figure 7.1. Schedule dialog</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/usage-advisor-configuration.png" alt="Schedule Dialog"></div></div><p>
      The dialog box allows you to configure the following fields:
    </p><div class="itemizedlist"><ul type="disc"><li><p>
          <code class="literal">Frequency</code> – Dictates how often the
          rule will run. The default value for different rules varies
          but a rule can be set to run at any interval desired.
        </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
            Setting the frequency of a rule involves tradeoffs. Rule
            evaluation consumes system resources — CPU, memory,
            and disk space. While the amount consumed is small, if you
            run all the rules against dozens of servers on a very
            frequent basis, you may put a significant load on the
            Service Manager. So select an appropriate frequency. For
            example, unless you are stopping and restarting your servers
            frequently, rules that check server configuration variables
            probably don't need to run very often.
          </p><p>
            Another consideration is that certain status variables
            increase monotonically until a server is restarted. Examples
            of these are <code class="literal">Key_reads</code>,
            <code class="literal">Qcache_hits</code>,
            <code class="literal">Questions</code>,
            <code class="literal">Table_locks_waited</code>, and similar
            variables. The value returned by <code class="literal">SHOW
            STATUS</code> for these variables is the value since the
            server was started (or since the last <code class="literal">FLUSH
            STATUS</code> command), which is not very useful for
            performance tuning, especially if the server has been
            running for an extended period of time. For performance
            tuning it is much better to know the change in state (i.e.
            delta) of these values over the last 10 minutes, 1 hour, or
            whatever time frame is appropriate for your application. The
            frequency at which you schedule a rule is the time frame
            used to calculate the delta values of these variables, and
            it is the delta that is used in expression evaluation, not
            the absolute value. Consequently, select a frequency that is
            appropriate for the metrics being used in the expression.
          </p></div></li><li><p>
          <code class="literal">Notifications</code> – A listbox of users
          and/or notification groups who will be emailed when an advisor
          reaches an alert level. Single or multiple selections are
          allowed. For instructions on setting up notification groups
          see, <a href="#mnmas-notification-groups" title="6.5. Notification Groups">Section 6.5, “Notification Groups”</a>.
        </p></li></ul></div><p>
      Set the frequency, identify whomever you wish to notify, and click
      <span class="guibutton">schedule</span> to schedule the advisor. Upon
      completion, you should see the message, <code class="literal">Successfully
      scheduled</code>.
    </p><p>
      If you haven't set up global SNMP traps and would like your
      Network Management System (NMS) to handle events related to a
      specific rule then check the <code class="literal">Use SNMP Traps</code>
      checkbox. For more information about Simple Network Management
      Protocol (SNMP) see <a href="#mnmas-snmp-traps" title="6.1.1. SNMP Traps">Section 6.1.1, “SNMP Traps”</a>.
    </p><p>
      Scheduling rules using the checkbox and the
      <span class="guibutton">schedule</span> button is an effective way to
      schedule multiple rules. To schedule a single rule you may also
      use the <code class="literal">schedule</code> link.
    </p><p>
      When scheduling more than one rule, you have the option of
      selecting a checkbox to use the default frequency of each rule or
      you may choose a frequency that will apply to all selected rules.
      When customizing the frequency, take care that you choose a value
      that is appropriate to all the rules selected.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        If the agent does not have the <code class="literal">SUPER</code>
        privilege and InnoDB-related rules are scheduled, a warning will
        appear in the <code class="literal">DataCollection</code> log. This also
        occurs if <code class="literal">mysqld</code> is started with the
        <code class="option">skip-innodb</code> option. For more information about
        agent rights see <a href="#mnmas-agent-rights" title="3.4.1. Creating a MySQL User Account for the Service Agent">Section 3.4.1, “Creating a MySQL User Account for the Service Agent”</a>.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-heat-chart-notifications"></a>7.2.1. Heat Chart Notifications</h3></div></div></div><p>
        It is particularly important that
        <code class="literal">Notifications</code> be set for the <code class="literal">Heat
        Chart</code> group of rules. This is easily done from the
        <code class="literal">Current Schedule</code> page by clicking the
        <span class="guibutton">+</span> button beside a rule and then clicking
        a server.
      </p><p>
        Doing this opens a window with three
        tabs—<code class="literal">Overview</code>,
        <code class="literal">Settings</code>, and <code class="literal">Advanced</code>.
      </p><p>
        The <code class="literal">Overview</code> tab shows which advisor group a
        rule belongs to, a description of its purpose, and a link to the
        history of this alert.
      </p><p>
        In the <code class="literal">Settings</code> tab you can adjust the
        frequency of this rule and also specify a notification group. To
        select more than one contiguous group press the
        <code class="literal">Shift</code> key and click the desired groups. (Some
        web browsers may require that you drag your selection.)
        Non-contiguous selections are made by holding down the
        <code class="literal">Control</code> key and clicking the desired groups.

        
      </p><p>
        If you haven't set up global SNMP traps and would like your
        Network Management System (NMS) to handle events related to a
        specific rule then check the <code class="literal">Use SNMP Traps</code>
        checkbox. For more information about Simple Network Management
        Protocol (SNMP) see <a href="#mnmas-snmp-traps" title="6.1.1. SNMP Traps">Section 6.1.1, “SNMP Traps”</a>.
      </p><p>
        The <code class="literal">Advanced</code> tab gives detailed information
        about how this rule is implemented.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-editing-built-in-rules"></a>7.3. Editing Built-in Rules</h2></div></div></div><p>
      The frequency and thresholds defined for a rule are default
      recommendations. To edit these properties choose the
      <code class="literal">Create/Edit Rule</code> link.
    </p><p>
      The following image shows the advisor editor screen for the
      <code class="literal">Heat Chart</code> rule, <code class="literal">Temporary Tables to
      Disk Ratio Excessive</code>:
    </p><div class="figure"><a name="mnmas-edit-advisor"></a><p class="title"><b>Figure 7.2. Edit rule screen</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/advisors-edit.png" alt="Edit rule screen"></div></div><p>
      Beside the rule name is the <code class="literal">Advisor</code> drop-down
      list box, used for setting the advisor group. This list box shows
      existing groupings and any you may have added. The
      <code class="literal">Expression</code> textarea shows the advisor rule,
      <code class="literal">Variable Assignment</code> the data item associated
      with variable(s) used in the rule and
      <code class="literal">Thresholds</code> determines when to trigger each
      alert type.
    </p><p>
      The three levels of <code class="literal">Thresholds</code> are
      <code class="literal">Info Alert</code>, <code class="literal">Warning Alert</code>,
      and <code class="literal">Critical Alert</code> indicating increasing levels
      of severity. Levels can be triggered by the expression result
      being equal to a certain value, greater than a certain value, or
      less than a certain value.
    </p><p>
      The data items that variables are associated with are operating
      system (OS) properties such as available RAM or MySQL
      characteristics such as the InnoDB buffer pool. To see all
      available data items drop down the <code class="literal">Data Item</code>
      list box.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        For a list of all the built-in variables used in creating rules
        see
        <a href="http://dev.mysql.com/doc/refman/5.0/en/mysqld-option-tables.html" target="_top">http://dev.mysql.com/doc/refman/5.0/en/mysqld-option-tables.html</a>.
      </p></div><p>
      In this example, the <code class="literal">Expression</code> calculates the
      ratio of temporary tables. The drop-down <code class="literal">Data
      Item</code> list in <code class="literal">Variable Assignment</code>
      shows the various MySQL server status or operating system specific
      variables that may be used in expressions. The text boxes below
      <code class="literal">Thresholds</code> define the levels at which
      informational, warning, or critical alerts are issued.
    </p><p>
      To lower the threshold for an informational alert, simply increase
      the number given in the <code class="literal">Info Alert</code> text box.
    </p><p>
      When a data item can apply to multiple objects, you need to
      specify which instance to use for that item, hence the
      <code class="literal">Instance</code> text box. In almost all cases this
      should be set to <code class="literal">local</code>. The exceptions are as
      follows:

      </p><div class="itemizedlist"><ul type="disc"><li><p>
            For CPU-related items set <span class="guilabel">Instance</span> to
            <code class="literal">cpu0</code>. Additional CPUs on a system are
            referred to as <code class="literal">cpu1, cpu2</code> and so on.
          </p></li><li><p>
            There can be multiple disks mounted on a system. To refer to
            a specific drive set <span class="guilabel">Instance</span> to the
            name of of the mounted drive. On Windows this would be
            <code class="literal">C:, D:</code>, and so on. On Unix systems, use
            whatever is valid for the <span><strong class="command">df</strong></span> command.
          </p></li><li><p>
            For RAM-related items set <span class="guilabel">Instance</span> to
            <code class="literal">mem</code>.
          </p></li><li><p>
            Where there are table-specific variables the database name
            and table name must be specified in the
            <span class="guilabel">Instance</span> text box. This topic is
            discussed in detail in what follows.
          </p></li></ul></div><p>
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        It is not possible to have a data item that is unrelated to an
        instance. This raises the error, <code class="literal">You must map
        "&lt;variable&gt;" to an instance.</code>, and you will be
        unable to save the rule.
      </p></div><p>
      An agent can only collect data from one MySQL server, so the
      <code class="literal">instance</code> entry for a variable in a rule does
      not need to specify which MySQL server to use; no matter how many
      servers are being monitored there is always a one-to-one
      relationship between an agent and its monitored server.
    </p><p>
      However, on one server there may be multiple occurrences of a
      variable. For example, there are multiple possible occurrences of
      table-specific variables such as <code class="literal">Avg_row_length</code>
      because there can be multiple databases and tables defined in a
      MySQL server. In this case, the “<span class="quote">instance</span>” refers to
      the database and table that a data item should be associated with,
      specified in the form
      <em class="replaceable"><code>databasename</code></em>.<em class="replaceable"><code>tablename</code></em>.
      So, for example, if you want to reference the
      <code class="literal">Avg_row_length</code> of the <code class="literal">mysql</code>
      database <code class="literal">user</code> table in an expression, select
      the <code class="literal">mysql:tablestatus:Avg_row_length</code> from the
      <span class="guilabel">Data Item</span> list box and specify
      <code class="literal">mysql.user</code> in the <span class="guilabel">Instance</span>
      text box.
    </p><p>
      On the other hand, in the case of a global server status variable,
      there is only one possible target. For example, there can only be
      one instance of <code class="literal">Key_reads</code> because this variable
      applies to the server as a whole. Likewise, there can only be one
      instance of <code class="literal">query_cache_size</code>. In this case
      specify <code class="literal">local</code> in the
      <span class="guilabel">Instance</span> text box.
    </p><p>
      To save your changes click the <span class="guibutton">Save</span> button
      at the bottom of the page.
    </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        You can change only the thresholds and the frequency of built-in
        rules. So that rules function properly when updated, other
        changes are prohibited.
      </p><p>
        Should you wish to make other changes to a built-in rule, copy
        it and modify it as desired.
      </p></div><p>
      You can edit a rule even if it is currently scheduled. Your
      changes will not be overwritten when new rules are imported using
      the <code class="literal">Check for Updates</code> link.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-creating-advisors-and-rules"></a>7.4. Creating Advisors and Rules</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-creating-advisors">7.4.1. Creating Advisors</a></span></dt><dt><span class="section"><a href="#mnmas-creating-rules-overview">7.4.2. Overview of Rule Creation</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-variables">7.4.3. Variables</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-thresholds">7.4.4. Thresholds</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-using-strings">7.4.5. Using Strings</a></span></dt><dt><span class="section"><a href="#mnmas-advisors-wiki-format">7.4.6. Wiki Format</a></span></dt></dl></div><p>
      In addition to using and editing the advisors and rules provided
      by MySQL Enterprise, users can create their own advisors and rules
      to meet their own unique needs. To do this go to the
      <code class="literal">Advisors</code> page and choose the
      <code class="literal">Create/Edit Rule</code> link.
    </p><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-creating-advisors"></a>7.4.1. Creating Advisors</h3></div></div></div><p>
        Similar existing rules are grouped together in advisor groups.
      </p><p>
        The built-in advisors are:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Administration
            </p></li><li><p>
              Heat Chart
            </p></li><li><p>
              Performance
            </p></li><li><p>
              Replication
            </p></li><li><p>
              Schema
            </p></li><li><p>
              Security
            </p></li></ul></div><p>

        The ability to create your own advisor group allows you to
        create groupings suitable to your circumstances.
      </p><p>
        You can create your own grouping by simply clicking the
        <span class="guibutton">create advisor</span> button. Enter an
        appropriate name and click the <span class="guibutton">add</span>
        button. The newly created group will appear in the
        <code class="literal">Advisor</code> column.
      </p><p>
        The newly created advisor is added to the list box of advisors
        shown in <a href="#mnmas-edit-advisor" title="Figure 7.2. Edit rule screen">Figure 7.2, “Edit rule screen”</a>. You can now use this
        category of advisors when you create a new rule.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-creating-rules-overview"></a>7.4.2. Overview of Rule Creation</h3></div></div></div><p>
        Rules are created using the same screen seen in
        <a href="#mnmas-edit-advisor" title="Figure 7.2. Edit rule screen">Figure 7.2, “Edit rule screen”</a>. To begin creating a rule from
        scratch, click the <span class="guibutton">create rule</span> button.
        However, the simplest way to create a new rule is to copy an
        existing one. Unlike editing an existing rule, when you copy a
        rule, every element of that rule is editable.
      </p><p>
        You can change the rule name, the advisor group that a rule
        belongs to and you can set your own version number. In
        <a href="#mnmas-edit-advisor" title="Figure 7.2. Edit rule screen">Figure 7.2, “Edit rule screen”</a>, you have already seen how the
        threshold and frequency of a rule may be altered.
      </p><p>
        Most importantly you can alter a rule's expression. Expressions
        are the core of a MySQL Network Advisor and are used to define the
        scenario being monitored. An expression can be as simple as a
        single server parameter or can be quite complex, combining
        multiple parameters with various mathematical operations.
      </p><p>
        An expression has two main characteristics:

        </p><div class="itemizedlist"><ul type="disc"><li><p>
              An expression defines a situation where a best practice is
              not being followed
            </p></li><li><p>
              The result of an expression must always be 1 or 0 (that
              is, true or false)
            </p></li></ul></div><p>

        If an expression evaluates to true for a specific server, an
        alarm is raised, indicating that a best practice is not being
        followed. If an expression evaluates to false no alarm is raised
        because the best practice is indeed being followed.
      </p><p>
        For example, if having binary logging enabled is considered a
        best practice for a production server (which we believe it is),
        then this best practice is being violated if
        <code class="literal">log_bin</code> is <code class="literal">OFF</code>.
        Consequently, the expression for the “<span class="quote">Binary Logging Not
        Enabled</span>” rule is “<span class="quote">%log_bin% == OFF</span>”. If this
        evaluates to 1, an alarm is raised because the best practice is
        not being followed.
      </p><p>
        An expression is made up of one or more variables and zero or
        more mathematical operators. The MySQL Network Monitoring and Advisory Service uses the MySQL
        database server's expression parser and evaluator For a complete
        list of operators and functions see
        <a href="http://dev.mysql.com/doc/refman/5.0/en/functions.html" target="_top">http://dev.mysql.com/doc/refman/5.0/en/functions.html</a>.
        For a complete list of the built-in variables used when creating
        rules see
        <a href="http://dev.mysql.com/doc/refman/5.0/en/mysqld-option-tables.html" target="_top">http://dev.mysql.com/doc/refman/5.0/en/mysqld-option-tables.html</a>.
      </p><p>
        Creating an expression is dependent on variables defined in the
        <span class="guilabel">Variable Assignment</span> frame. This frame links
        variables used in the expression field with data gathered from
        the target MySQL server instance—server status variables,
        operating system status information, and table information.
        Variable names are associated with elements in the
        <span class="guilabel">Data Item</span> drop-down list. If you need to
        define more than one variable simply click the <span class="guibutton">add
        row</span> button.
      </p><p>
        The remaining fields determine the information that displays in
        a notification email or the informational pop-up window
        associated with each advisor.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-advisors-variables"></a>7.4.3. Variables</h3></div></div></div><p>
        When an expression is evaluated variables get replaced by
        values. For example, part of the expression for the
        “<span class="quote">MyISAM Key Cache Has Sub-Optimal Hit Rate</span>” rule
        calculates the hit rate as follows:
      </p><pre class="programlisting">100-((%Key_reads% / %Key_read_requests%)*100) 
</pre><p>
        If the current value of <code class="literal">%Key_reads%</code> is 4522
        and the current value of <code class="literal">%Key_read_requests%</code>
        is 125989, the hit ratio assesses to 96.4%:
      </p><pre class="programlisting">100 -((4522 / 125989) * 100)
</pre><p>
        By convention, the Advisors supplied by MySQL use
        ‘<code class="literal">%</code>’ as the delimiter, for
        example, <code class="literal">%Key_reads%</code>. This makes variables
        more readily identifiable.
      </p><p>
        In addition to being used in an expression, variables may also
        be used in the <code class="literal">Description</code>,
        <code class="literal">Advice</code>, <code class="literal">Action</code>, and
        <code class="literal">Links</code> attributes of a rule. This allows you
        to report the current value of an expression.
      </p><p>
        For instance, you can add the message, “<span class="quote">The current value
        of Key_reads is %Key_reads%.</span>” to the
        <code class="literal">Advice</code> text box. When this is displayed on
        the screen, the value of <code class="literal">%Key_reads%</code> is
        substituted into the text. Supposing
        <code class="literal">%Key_reads%</code> has a value of
        <code class="literal">4522</code>, the message becomes “<span class="quote">The current
        value of Key_reads is 4522.</span>”
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-advisors-thresholds"></a>7.4.4. Thresholds</h3></div></div></div><p>
        Each expression has a threshold value that triggers an alert.
        The <code class="literal">THRESHOLD</code> keyword is used to associate
        that value with an alert level—either an
        <code class="literal">Info</code>, <code class="literal">Warning</code>, or
        <code class="literal">Critical</code> alert.
      </p><p>
        For example, the expression for the performance advisor,
        “<span class="quote">Thread Cache Size May Not Be Optimal</span>”, is:
      </p><pre class="programlisting">100-((%Threads_created% / %Connections%) * 100) &lt; THRESHOLD 
</pre><p>
        The <code class="literal">THRESHOLD</code> is set at 95% for an Info level
        alert, 85% for a Warning alert, and 75% for a Critical alert;
        producing alerts of three different levels.
      </p><p>
        Expressions can be quite simple. The expression for
        “<span class="quote">Binary Logging Not Enabled</span>” (one of the
        Administration alerts) is:
      </p><pre class="programlisting">%log_bin% == THRESHOLD 
</pre><p>
        When the result is <code class="literal">OFF</code>, only one alert is
        triggered—a Warning level alert. In this situation you
        might think we could just use the expression <code class="literal">%log_bin%
        == "OFF"</code>. However, doing this would not test binary
        logging against a threshold so would not result in an alert.
      </p><p>
        When you create an expression, think carefully about the
        conditions under which it should be evaluated and the conditions
        under which it should not. For example, the expression for the
        “<span class="quote">MyISAM Key Cache Has Sub-Optimal Hit Rate</span>” rule
        is:
      </p><pre class="programlisting">(%Uptime% &gt; 10800) &amp;&amp; (%Key_read_requests% &gt; 10000) »
 &amp;&amp; (100-((%Key_reads% / %Key_read_requests%) * 100) &lt; THRESHOLD)
</pre><p>
        The essence of the rule is really: <code class="literal">(100-((%Key_reads% /
        %Key_read_requests% ) * 100) &lt; THRESHOLD)</code>. However,
        when a server is first starting up, it may take a while to reach
        a state that is representative of normal operations. For
        example, the key cache and the query cache may need some period
        of time before they have cached typical application data as
        opposed to start-up and initialization data. In this case, the
        first part of the expression, <code class="literal">(%Uptime% &gt;
        10800)</code>, holds off evaluating this expression until the
        system has been running for 10800 seconds (3 hours).
      </p><p>
        In addition, if some part of the system is not heavily used an
        alert may be triggered based on limited data. For example, if
        your application does not use the MyISAM storage engine, the
        “<span class="quote">MyISAM Key Cache Has Sub-Optimal Hit Rate</span>” rule
        may be triggered based on very limited use of other MyISAM
        tables such as the <code class="literal">mysql.user</code> table. For this
        reason, this advisor has a second part—
        <code class="literal">(%Key_read_requests% &gt;
        10000)</code>–meaning the rule won't be evaluated
        unless there is plenty of activity associated with the key
        cache.
      </p><p>
        In other circumstances, there may be periods of time during
        which you don't want a rule to be evaluated—a blackout
        period. For example, the expression for the “<span class="quote">Slave Too Far
        Behind Master</span>” rule is: <code class="literal">%Seconds_Behind_Master%
        &gt; THRESHOLD</code>. However, suppose you run a backup
        process between 6 and 7 pm on a replication slave, and it's
        normal for that slave to get behind the master by an amount more
        than the THRESHOLD during that time. In that case you don't want
        to receive an alert because the rule violation is expected. You
        can achieve this by adding the following to the expression:
        &amp;&amp; CURTIME() NOT BETWEEN '18:00:00' AND '19:00:00' In
        essence, this means “<span class="quote">don't trigger an alert between
        18:00:00 and 19:00:00 (6 pm and 7 pm)</span>”.
      </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-advisors-using-strings"></a>7.4.5. Using Strings</h3></div></div></div><p>
        String values may appear in the <code class="literal">Expression</code> or
        the <code class="literal">Thresholds</code> text boxes. In both cases,
        they must be enclosed within quotation marks. For example, the
        expression for the “<span class="quote">Slave I/O Thread Not Running</span>”
        rule is:
      </p><pre class="programlisting">(%Slave_running% == "ON") &amp;&amp; (%Slave_IO_Running% != THRESHOLD)
</pre><p>
        In similar fashion the <code class="literal">Critical Alerts</code>
        threshold text box is set to a value of
        <code class="literal">"Yes"</code>.
      </p><p>
        When the expression is evaluated, either
        <code class="literal">"OFF"</code> or <code class="literal">"ON"</code> will be
        substituted for <code class="literal">%Slave_running%</code>, and
        <code class="literal">"Yes"</code> or <code class="literal">"No"</code> for
        <code class="literal">%Slave_IO_Running%</code>, depending on the state of
        your system. If the slave is running but the I/O thread is not,
        the expression then becomes:
      </p><pre class="programlisting">("ON" == "ON") &amp;&amp; ("No" != "Yes")
</pre><p>
        Without quotation marks this expression would not evaluate to
        <code class="literal">TRUE</code> as it should.
      </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
          So that it is interpreted properly, the <code class="literal">==</code>
          operator is converted to <code class="literal">=</code> before being
          passed to the MySQL expression parser.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-advisors-wiki-format"></a>7.4.6. Wiki Format</h3></div></div></div><p>
        When editing or defining a rule, the text entered in the
        <code class="literal">Problem Description</code>,
        <code class="literal">Advice</code>, <code class="literal">Recommended
        Action</code>, and <code class="literal">Links and Further
        reading</code> text boxes may be formatted in Wiki format.
        This allows you to format text and add hyperlinks when creating
        or editing your own rules.
      </p><p>
        Find a brief introduction to using Wiki formatting in the
        following table.
      </p><div class="table"><a name="id2478804"></a><p class="title"><b>Table 7.1. Wiki formatting</b></p><table summary="Wiki formatting" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Example</strong></span></th><th><span class="bold"><strong>Description</strong></span></th></tr></thead><tbody><tr><td>__<em class="replaceable"><code>bold</code></em>__</td><td>boldface text</td></tr><tr><td>~~<em class="replaceable"><code>italic</code></em>~~</td><td>italicize text</td></tr><tr><td>\\</td><td>create a line break</td></tr><tr><td>\\ \\</td><td>create a double line break</td></tr><tr><td>\\\\<em class="replaceable"><code>G</code></em></td><td>create a backslash</td></tr><tr><td>*<em class="replaceable"><code>item 1</code></em></td><td>create a bulleted list item</td></tr><tr><td>#<em class="replaceable"><code>item 1</code></em></td><td>create a numbered list item</td></tr><tr><td>\<em class="replaceable"><code>_</code></em></td><td>use the ‘<code class="literal">\</code>’ to escape special characters</td></tr><tr><td>{moreInfo:name|url}</td><td>create a hyperlink</td></tr></tbody></table></div><p>
        So the following Wiki text:
      </p><pre class="programlisting">Replication is a __very nice feature__ of MySQL.  Replication can be very
useful for solving problems in the following areas:
* Data Distribution
* Load Balancing
* Backup and Recovery
You can check replication status and start a slave using the following
commands: SHOW SLAVE STATUS \\\\G\\START SLAVE;
{moreInfo:MySQL Manual: Replication
      FAQ|http://dev.mysql.com/doc/refman/5.0/en/replication-faq.html}
</pre><p>
        Would be translated into the following HTML markup:
      </p><pre class="programlisting">Replication is a &lt;b&gt;very nice feature&lt;/b&gt; of MySQL.  Replication can be very
useful for solving problems in the following areas:
&lt;ul&gt;
  &lt;li&gt;Data distribution&lt;/li&gt;
  &lt;li&gt;Load Balancing&lt;/li&gt;
  &lt;li&gt;Backup and recovery&lt;/li&gt;
&lt;/ul&gt;You can check replication status and start a slave with the following
commands: SHOW SLAVE STATUS \G;&lt;br/&gt;START SLAVE;
&lt;a href="http://dev.mysql.com/doc/refman/5.0/en/replication-faq.html"
  target="_blank" &gt;MySQL Manual: Replication FAQ&lt;/a&gt;
</pre><p>
        To find out more about this format go to the
        <a href="http://wikipedia.org" target="_top">wikipedia.org</a> web
        site.
      </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-unscheduling-advisors"></a>7.5. Disabling and Unscheduling Advisors</h2></div></div></div><p>
      In some circumstances you may no longer wish to apply a rule
      against a specific server or group of servers and in other
      circumstances you may want to suspend a rule for a short length of
      time. With this in mind, it is possible to disable or unschedule a
      rule.
    </p><p>
      To disable or unschedule an advisor choose the <code class="literal">Current
      Schedule </code> screen of the <code class="literal">Advisors</code> tab.
    </p><p>
      Rules may be disabled or unscheduled using the buttons on the
      upper or lower left of the screen. You may also change a rule by
      clicking the <code class="literal">enabled</code> or
      <code class="literal">unschedule</code> hyperlink to the right of a rule.
      The buttons are particularly useful when you are altering more
      than one rule.
    </p><p>
      To no longer run a rule against a specific server, expand the
      advisor group and the specific rule by clicking the
      <span class="guibutton">+</span> button. You may then click the
      <span class="guibutton">unschedule</span> button. When the dialog window
      opens, choose the <span class="guibutton">unschedule</span> button and
      that rule will no longer be applied. If you wish to back out of
      the operation choose <span class="guibutton">cancel</span>. If, at a later
      date, you wish to institute this rule again, you may do so from
      the <code class="literal">Add to Schedule</code> page.
    </p><p>
      If you want to suspend a rule temporarily, use the
      <span class="guibutton">disable</span> button and follow the same process
      you would for unscheduling. Once a rule is disabled the link under
      the status column changes to red and reads
      <code class="literal">disabled</code>. When a rule is disabled, data is no
      longer collected for that rule. A disabled rule is easily
      re-enabled by clicking the <code class="literal">disabled</code> link or by
      using the <span class="guibutton">enable</span> button.
    </p><p>
      Multiple rules may be altered for one or more servers by selecting
      the appropriate checkbox and then clicking the
      <span class="guibutton">unschedule</span>, <span class="guibutton">enable</span>,
      or <span class="guibutton">disable</span> button.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-advisor-blackouts"></a>7.6. Scriptable Advisor Blackout Periods</h2></div></div></div><p>
      Database servers require regular maintenance and during these
      periods you may wish to stop Service Agents from reporting their
      findings. During a blackout period rules are not evaluated and
      notifications are put on hold but Service Agents continue to
      collect data . In this respect blacked-out rules differ from
      disabled rules; data continues to be collected and stored in the
      repository.
    </p><p>
      Blackout periods are enabled by entering the following URL into
      the address bar of your browser, substituting the appropriate
      hostname, port and server name:
    </p><pre class="programlisting">http://<em class="replaceable"><code>localhost:18080</code></em>/merlin/inventory?command=blackout »
 &amp;server_name=<em class="replaceable"><code>SuSE:3306</code></em>&amp;blackout_state=true
</pre><p>
      If you are unsure of the hostname and port to use, check the
      <code class="filename">configuration_report.txt</code> file. Be sure to
      specify the Tomcat port and not the port number for the Dashboard.
      Specify the server you wish to blackout using the name that
      appears in the Server Tree, being sure to include a colon and port
      number as shown in the preceding listing.
    </p><p>
      An HTTP authentication dialog box requesting your Dashboard
      username and password will open. Specify the credentials used for
      the root role when you first installed the MySQL Network Service Manager. The
      default username is <code class="literal">admin</code>; there is no default
      password.
    </p><p>
      You can also blackout a server group by entering the following URL
      into the address bar of your browser, substituting the appropriate
      hostname, and server group name:
    </p><pre class="programlisting">http://<em class="replaceable"><code>localhost:18080</code></em>/merlin/inventory?command=blackout »
 &amp;group_name=<em class="replaceable"><code>Finance</code></em>&amp;blackout_state=true
    </pre><p>
      When the HTTP authentication dialog box opens, enter the
      administrator's credentials.
    </p><p>
      To reactivate the blacked-out server or server group, use the
      appropriate URL and query string, changing the
      <code class="literal">blackout_state=true</code> name/value pair to
      <code class="literal">blackout_state=false</code>.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-events"></a>Chapter 8. Monitoring and Responding to Advisor Events</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-closing-events">8.1. Closing an Event</a></span></dt></dl></div><p>
    Once an advisor has been scheduled, it will run at set intervals. If
    it finds nothing of interest no alerts or emails will be created.
  </p><p>
    When alerts are triggered, they appear on the
    <code class="literal">Events</code> screen. Alerts also appear on the
    <code class="literal">Monitor</code> screen in order of severity.
    The notification group or groups associated with a specific rule
    receive email notification when an alert is triggered. For
    more information about creating notification groups see
    <a href="#mnmas-notification-groups" title="6.5. Notification Groups">Section 6.5, “Notification Groups”</a>.
  </p><p>
    To view open events, click on the <code class="literal">Events</code> tab.
    The tree-view on the left determines which server or server group
    these events belong to. Open events are shown in tabular format.
    
  </p><div class="figure"><a name="mnmas-events-screen"></a><p class="title"><b>Figure 8.1. Events screen</b></p><div class="mediaobject"><img src="<s:property value="helpImgPath"/>/events-screen.png" alt="Events screen"></div></div><p>
    The event table has the following columns:
  </p><div class="itemizedlist"><ul type="disc"><li><p>
        <span class="guilabel">Severity</span> – An icon indicating the
        severity of the alert
      </p></li><li><p>
        <span class="guilabel">Server</span> – The name of the server the
        alert applies to
      </p></li><li><p>
        <span class="guilabel">Advisor</span> – The category of the advisor
      </p></li><li><p>
        <span class="guilabel">Rule</span> – A short description of the rule
        that has been violated
      </p></li><li><p>
        <span class="guilabel">Time</span> – The approximate time the event
        occurred
      </p></li><li><p>
        <span class="guilabel">Status</span> – The status of the event
      </p></li><li><p>
        <span class="guilabel">Unnamed Column</span> – Provides a link to the
        <code class="literal">Close</code> dialog box
      </p></li></ul></div><p>
    By default, all events are shown but the list of events can be
    filtered using the form displayed above the event list. The options
    include filtering by:
  </p><div class="itemizedlist"><ul type="disc"><li><p>
        Severity
      </p></li><li><p>
        Date
      </p></li><li><p>
        Advisor group
      </p></li><li><p>
        Specific rule
      </p></li><li><p>
        Status
      </p></li></ul></div><p>
    Choose the options you are interested in and click the
    <span class="guibutton">filter</span> button to refresh the display. You may
    limit the number of items that appear on a page by choosing a
    different value from the <span class="guilabel">Limit</span> drop down listbox.
  </p><p>
    The drop down list box showing severity has the options:
    <code class="literal">All</code>, <code class="literal">All Alerts</code>,
    <code class="literal">Critical</code>, <code class="literal">Warning</code>,
    <code class="literal">Info</code>, <code class="literal">Success</code>, and
    <code class="literal">Unknown</code>. Selecting the option
    <code class="literal">All</code> shows all alerts and also those
    rules that have run successfully. <code class="literal">All Alerts</code>
    shows only those rules that have been violated.
  </p><p>
    Columns are sorted by clicking on the individual column headings.
    The alerts shown in <a href="#mnmas-events-screen" title="Figure 8.1. Events screen">Figure 8.1, “Events screen”</a>, are sorted by
    decreasing severity. An octagonal red icon indicates a critical
    alert, a triangular yellow icon a warning, and a conversation
    bubble an informational alert. A star beside an event indicates that
    the rule has run successfully and no alert created. A question mark icon
    indicates that the status of
    the rule is unknown.
  </p><p>
    The server shown in <a href="#mnmas-events-screen" title="Figure 8.1. Events screen">Figure 8.1, “Events screen”</a>, is filtered for <code class="literal">All</code>.
    Typically, when filtering by severity you would choose <code class="literal">All Alerts</code> and, if you
    see a <code class="literal">Critical</code>, <code class="literal">Warning</code>, or
    <code class="literal">Info</code> alert, use the
    <code class="literal">All</code> filter to see when the rule last ran
    successfully. This may assist in determining the cause of the alert.
  </p><p>
    Besides filtering for severity , you can also choose to filter for a specific time period using the
    <code class="literal">From</code> and <code class="literal">To</code> text boxes. You also have
    the choice of filtering by specific rules or categories of rules. The <code class="literal">Status</code>
    drop-down list box let's you choose <code class="literal">All</code>, <code class="literal">Open</code>,
    or <code class="literal">Closed</code> events. To avoid excessive scrolling, you can also limit the number of events
    that show on a specific page.
  </p><p>
    For more information about an alert, click on the rule name. A
    pop-up window will appear showing a description of the alert and the
    exact time of occurrence. This pop-up windows provides links to useful 
    resources and advice for resolution. You can also view the exact expression
    that generated the event.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-closing-events"></a>8.1. Closing an Event</h2></div></div></div><p>
      After determining what action to take, events should be closed.
    </p><p>
      To resolve an individual alert click the <code class="literal">close</code>
      link in the <span class="guilabel">Operations/Notes</span> column. Document
      the resolution using the <code class="literal">Notes</code> text area and
      choose the <span class="guibutton">close event(s)</span> button.
    </p><p>
      To close a number of alerts simultaneously, select the
      checkbox beside the alerts you wish to
      close and then click the <span class="guibutton">close</span> button to
      the lower or upper left side of the screen.
    </p><p>
      Once an event has been closed it appears on the <code class="literal">Events</code>
      screen showing a <code class="literal">resolution notes</code> link.
      Click this link to review the notes. 
      Events that have been closed are saved in the Repository. If you wish to
      view closed events filter the display by choosing <code class="literal">Closed</code> from the
      <span class="guilabel">Status</span> drop-down box.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-graphs-tab"></a>Chapter 9. The Graphs Page</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-available-graphs">9.1. Displaying Graphs</a></span></dt><dt><span class="section"><a href="#mnmas-setting-graph-interval">9.2. Setting an Interval</a></span></dt><dt><span class="section"><a href="#mnmas-setting-graph-time-span">9.3. Setting a Time Span</a></span></dt></dl></div><p>
    Navigate to the <code class="literal">Graphs</code> page by choosing the
    <span class="guilabel">Graphs</span> tab.
  </p><p>
    By default four graphs are displayed on the <code class="literal">Monitor
    page</code>. These graphs present information about the currently
    selected server or server group, showing the hit ratios, CPU
    utilization, connections, and database activity. Color coding helps
    distinguish different aspects of each graph.
  </p><p>
    From the <code class="literal">Monitor</code> page you can make permanent or
    temporary changes to the way a graph is displayed. For example, you
    can choose to display the last hour's activity or you can choose to
    view a specific period of time.
  </p><p>
    Persistent changes to the way the graphs display are only made from
    the <code class="literal">Monitor</code> page. You can set the size of the
    thumbnails and the full-sized graphs and you can also set their
    refresh interval. For more information see
    <a href="#mnmas-monitor-page-graphs" title="5.3. The Server Graphs and Critical Events">Section 5.3, “The Server Graphs and Critical Events”</a>. As
    with the <code class="literal">Monitor</code> page, the data shown in the
    graphs is determined by the server or group of servers selected in
    the server tree.
  </p><p>
    The <code class="literal">Graphs</code> page shows all the available graphs
    and provides the capability of adjusting the scale of the graphs,
    allowing a more or less detailed view as the situation requires. 
    To ensure that you have the latest versions of the various graphs 
    click on the <span class="guilabel">Check For Updates</span> link on
    the top left of this page.   
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-available-graphs"></a>9.1. Displaying Graphs</h2></div></div></div><p>
      The total number of graphs varies depending upon your subscription
      level. The four graphs that appear by default on the
      <code class="literal">Monitor</code> page are:

      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Hit Ratios
          </p></li><li><p>
            Database Activity
          </p></li><li><p>
            Connections
          </p></li><li><p>
            CPU Utilization
          </p></li></ul></div><p>
    </p><p>
      When the <code class="literal">Graphs</code> page is first opened, no graphs
      are visible. To view a graph click the <span class="guibutton">+</span>
      button on the left or, to view all graphs, use the
      <span class="guibutton">expand all</span> button.
    </p><p>
      The larger size of graphs is the primary reason for viewing graphs
      on the <code class="literal">Graphs</code> page rather than on the
      <code class="literal">Monitor</code> page. Additionally, you can only show a
      maximum of six graphs on the <code class="literal">Monitor</code> page; the
      remaining graphs can only be viewed from the <code class="literal">Graphs</code>
      page.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-setting-graph-interval"></a>9.2. Setting an Interval</h2></div></div></div><p>
      Change the interval for a graph by choosing values from the
      <span class="guilabel">Hours</span> and <span class="guilabel">Minutes</span>
      drop-down list boxes. If necessary adjust the width and height of
      the graph and then click the <span class="guibutton">update</span> button.
      The changes to the time span apply to all the graphs on the
      <code class="literal">Graphs</code> page but have <span class="emphasis"><em>no</em></span>
      effect on the graphs on the <code class="literal">Monitor</code> page.
    </p><p>
      To change the graphs both here and on the
      <code class="literal">Monitor</code> page use the <code class="literal">configure
      graphs</code> link on the top right. This opens a dialog box
      for setting the default interval for the x-axis. Save any changes
      that you have made and the values chosen will be the defaults
      whenever you log in. You can also change the defaults from the
      <code class="literal">Monitor</code> page as described in
      <a href="#mnmas-monitor-page-graphs" title="5.3. The Server Graphs and Critical Events">Section 5.3, “The Server Graphs and Critical Events”</a>; defaults for other users
      will be unchanged.
    </p><p>
      Use the <span class="guibutton">reset</span> button to restore the default
      value for the interval. Doing this will also reset the default
      size of the graphs.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-setting-graph-time-span"></a>9.3. Setting a Time Span</h2></div></div></div><p>
      Setting a graph to display a time span gives you a historical
      perspective on server activity. You may want to know what was
      happening at a specific point in time or you may wish to look at
      an extended period in order to determine patterns or trends.
      Changing the time span gives you the flexibility to do this.
    </p><p>
      In the <span class="guilabel">Time Display</span> drop-down list box select
      the <code class="literal">From/To</code> option. Choosing this option
      updates the display to include <span class="guilabel">To</span> and
      <span class="guilabel">From</span> text boxes.
    </p><p>
      Set the date you wish to start viewing from by manually entering
      the date in year, month, and day format (2007-03-14). However, it
      is much easier to click the calendar icon and choose a date from
      the drop-down calendar. Enter a terminating date in the same way.
      If you wish, you may also choose the specific time of day by
      selecting the hour and minute.
    </p><p>
      If necessary adjust the width and height of the graph and then
      click the <span class="guibutton">update</span> button. 
      The changes to the time span apply to all
      the graphs on the <code class="literal">Graphs</code> page but have
      <span class="emphasis"><em>no</em></span> effect on the graphs on the
      <code class="literal">Monitor</code> page. You cannot change the time span
      of the graphs that appear on the <code class="literal">Monitor</code> page.
      Changes apply only to the current user; defaults for other users
      will be unchanged.
    </p><p>
      Use the <span class="guibutton">reset</span> button to cancel your
      changes.
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-replication"></a>Chapter 10. The Replication Page</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-replication-details">10.1. Replication Page Details</a></span></dt></dl></div><p>
    Navigate to the <code class="literal">Replication</code> page by choosing the
    <span class="guilabel">Replication</span> tab. This page provides a quick
    summary view of the state of your replication servers
    or, if you wish, you can drill down and 
    determine specifics about any master or slave. 
    (<span class="emphasis"><em>Note</em></span>: Servers,
    whether masters or slaves, must be monitored in order for them to
    appear on this page.)
  </p><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
      There will be no <code class="literal">Replication</code> page if your
      subscription level does not support this feature. 
    </p></div><p>
    The <code class="literal">Replication</code> page groups all master servers
    with their slaves. Masters and their slaves are autodiscovered and a
    grouping is created. Scans run on a five
    minute interval, so depending upon the order of discovery, it can
    take as long as 2 polling intervals to create a complete group.
  </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
      The agent must be installed on the same
      machine as the server you are monitoring in order for discovery 
      to work properly. Do <span class="bold"><strong>not</strong></span> use remote 
      monitoring. 
    </p></div><p>
    Replication groups can be managed from the <code class="literal">Manage
    Servers</code> page in the same way as other groups. However, any
    slaves removed from a server group will automatically be restored to
    that group. It is also possible to add non-slaves to a replication
    grouping. For more information about server groupings see
    <a href="#mnmas-server-grouping" title="6.3.1. Grouping Servers">Section 6.3.1, “Grouping Servers”</a>.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-replication-details"></a>10.1. Replication Page Details</h2></div></div></div><p>
      Choose a value from the <span class="guibutton">Refresh</span> drop-down
      list box to set the rate at which information is updated. This
      refresh rate applies only to the information presented on this
      page: It is independent of the rate set for the
      <code class="literal">Monitor</code> page.
    </p><p>
      The following columns describe replication servers and their
      slaves:

      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Servers – Displays the group name and any master
            servers and slaves
          </p></li><li><p>
            Type – Indicates the topology of a server group or
            in the case of individual servers, whether a server is 
            a master, a master/slave,
            or a slave
          </p></li><li><p>
            Slave IO – Reports the status of the slave IO thread
          </p></li><li><p>
            Slave SQL – Reports the status of the slave SQL thread
          </p></li><li><p>
            Seconds Behind – The number of seconds the slave is
            behind the master. This column is blank if a server is a
            master.
          </p></li><li><p>
            Binlog – The binlog file name
          </p></li><li><p>
            Binlog Pos – The current position in the binlog file
          </p></li><li><p>
            Master Binlog – The master binlog file name
          </p></li><li><p>
            Master Binlog Pos – The current position in the master
            binlog file
          </p></li><li><p>
            Last Error – The most recent error
          </p></li><li><p>
            Unlabeled Column – Use the <span class="guilabel">rename group</span>
            link on the server group line to edit the server group name
          </p></li></ul></div><p>
    </p><p>
      Levels of indentation in the <code class="literal">Servers</code>
      column show the relationship between master servers and
      their slaves.
      Most column headings are active links that allow 
      you to change the order of display by clicking on the
      header.
      Sorting works differently for different column groupings.
      Click the <code class="literal">Seconds Behind</code> header to
      order servers by the number of seconds they are behind their master.
      However, in all cases, the server topology is respected. For example,
      in a <code class="literal">TREE</code> topology, ordering occurs within
      branches only.
    </p><p>
      If the agent is down, servers show in bold red in the
      <code class="literal">Servers</code> column. The <code class="literal">Slave IO</code>
      and the <code class="literal">Slave SQL</code> columns display
      <code class="literal">stopped</code> in red text if these threads are
      not running. If an agent is down, italics is used to
      display the last know status of the IO or SQL threads.
      
    </p><p>
      Clicking on a master server opens a dialog box that displays
      information about the server. The information shown includes:

      </p><div class="itemizedlist"><ul type="disc"><li><p>
            The number of slave servers
          </p></li><li><p>
            The binlog file name
          </p></li><li><p>
            The binlog position
          </p></li><li><p>
            Which databases are replicated and which not
          </p></li></ul></div><p>

      The dialog box also includes a link that allows the user to hide
      or show the slave servers.
    </p><p>
      Likewise, clicking on a slave server opens a dialog window showing extensive
      information about the slave.

      
    </p><p>
      
    </p></div></div><div class="chapter" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-uninstall"></a>Chapter 11. Uninstalling the MySQL Network Monitoring and Advisory Service</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-windows-removal">11.1. Removing the MySQL Network Monitoring and Advisory Service: Windows</a></span></dt><dd><dl><dt><span class="section"><a href="#id2480640">11.1.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-agent-windows">11.1.2. Removing the Service Agent</a></span></dt></dl></dd><dt><span class="section"><a href="#mnmas-unix-osx-removal">11.2. Removing the MySQL Network Monitoring and Advisory Service: Unix and Mac OS X</a></span></dt><dd><dl><dt><span class="section"><a href="#id2481066">11.2.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-service-agent-unix-osx">11.2.2. Removing the Service Agent</a></span></dt></dl></dd></dl></div><p>
    Removal of the MySQL Network Monitoring and Advisory Service requires removal of the MySQL Network Service Manager and
    the MySQL Network Service Agent Service. In some circumstances, when running
    multiple agents on one machine for instance, you may not want to
    remove the entire MySQL Network Service Agent Service but only a single agent.
    This topic is also covered.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-windows-removal"></a>11.1. Removing the MySQL Network Monitoring and Advisory Service: Windows</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#id2480640">11.1.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-agent-windows">11.1.2. Removing the Service Agent</a></span></dt></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="id2480640"></a>11.1.1. Removing the MySQL Network Monitoring and Advisory Service Server</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#id2480740">11.1.1.1. Removing MySQL Network Monitoring and Advisory Service Services Only</a></span></dt></dl></div><p>
        Remove the MySQL Network Service Manager by going to the <code class="literal">Control
        Panel</code> and choosing <code class="literal">Add or Remove
        Programs</code>. Find the entry for <code class="literal">MySQL Network
        Monitoring and Advisory Service</code> and remove it. During
        the uninstall process you will be given the option of saving
        existing data and log files. Choose this option if you plan to
        reinstall the MySQL Network Monitoring and Advisory Service.
      </p><p>
        If you are not saving existing data, after MySQL Network Service Manager has
        been removed you may delete the <code class="filename">C:\Program
        Files\MySQL\Network\Monitoring</code> directory.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          If you chose not to remove existing data and log files when
          uninstalling MySQL Network Monitoring and Advisory Service do <span class="bold"><strong>not</strong></span>
          remove the <code class="filename">C:\Program
          Files\MySQL\Network\Monitoring</code> directory. Doing so
          will delete these files.
        </p></div><p>
        If you added the Tomcat/Apache web server to the list of Windows
        firewall exceptions, remove this service by opening the
        <code class="literal">Windows Firewall</code> from the <code class="literal">Control
        Panel</code>. Choose the <code class="literal">Exceptions</code> tab
        and delete the <code class="literal">Tomcat/Apache</code> entry.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="id2480740"></a>11.1.1.1. Removing MySQL Network Monitoring and Advisory Service Services Only</h4></div></div></div><p>
          When the MySQL Network Service Manager is installed, the Tomcat/Apache and
          MySQL server services are started. It is possible to remove these
          services without also removing your MySQL Network Service Manager
          installation. (For more information about these services see,
          <a href="#mnmas-starting-network-services-windows" title="3.2.1.3. Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows">Section 3.2.1.3, “Starting/Stopping The MySQL Network Monitoring and Advisory Service Services: Windows”</a> or,
          <a href="#mnmas-starting-network-services-unix-osx" title="3.2.2.1. Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X">Section 3.2.2.1, “Starting/Stopping the MySQL Network Monitoring and Advisory Service Daemons: Unix and Mac OS X”</a>.)
          
        </p><p>
          Do this by finding the <code class="literal">MySQL Network Monitoring and
          Advisory Service</code> menu option and choosing
          <code class="literal">Services</code> and then <code class="literal">Uninstall MySQL
          Network Monitoring and Advisory Service Services</code>.
          This will remove all the services associated with
          MySQL Network Service Manager.
        </p><p>
          You can confirm that these services have been removed by
          checking services in the Microsoft Management Console Services
          window.
        </p><p>
          If you wish to reinstall these services you can do this by
          using the <code class="literal">Install MySQL Network Monitoring and
          Advisory Service Services</code> menu option.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-removing-agent-windows"></a>11.1.2. Removing the Service Agent</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-remove-single-agent-windows">11.1.2.1. Removing a Single Agent</a></span></dt></dl></div><p>
        To remove the Service Agent itself, open the <code class="literal">Control
        Panel</code> and choose <code class="literal">Add or Remove
        Programs</code>. Find the entry for <code class="literal">MySQL Network
        Service Agent</code> and remove it. This will execute the
        uninstall program located in the <code class="filename">C:\Program
        Files\MySQL\MySQLNetwork\Agent</code> directory.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          If you are running more than one agent on the same machine and
          wish to remove only one of the agents, do
          <span class="bold"><strong>not</strong></span> remove the <code class="literal">MySQL
          Network Service Agent</code> entry from the <code class="literal">Add or
          Remove Programs</code> menu. To remove a single agent see
          <a href="#mnmas-remove-single-agent-windows" title="11.1.2.1. Removing a Single Agent">Section 11.1.2.1, “Removing a Single Agent”</a>.
        </p></div><p>
        After removing the Service Agent you may also need to remove the
        directories, <code class="filename">C:\Program Files\MySQL\Network</code>
        and <code class="filename">C:\Program Files\MySQL\Network\Agent</code>.
      </p><p>
        Removing the Service Agent in this fashion will remove the
        default service. However, if you are running additional Service
        Agents as described in <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>,
        you will have to remove those agents manually. See the next
        section for instructions on doing this.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-remove-single-agent-windows"></a>11.1.2.1. Removing a Single Agent</h4></div></div></div><p>
          If you are running more than one agent on the same machine and
          wish to remove only one of the agents, do
          <span class="bold"><strong>not</strong></span> remove the <code class="literal">MySQL
          Network Service Agent</code> entry from the <code class="literal">Add or
          Remove Programs</code> menu. To remove a single agent and
          leave other agents intact follow these steps:
        </p><div class="orderedlist"><ol type="1"><li><p>
              Stop the agent
            </p></li><li><p>
              Confirm the location of the log files
            </p></li><li><p>
              Remove the agent as a service
            </p></li><li><p>
              Remove/Archive the associated files
            </p></li></ol></div><p>
          It is best to stop the agent before removing it; for
          instructions on stopping an agent see,
          <a href="#mnmas-starting-agent-windows" title="3.4.3. Starting and Stopping the Agent on Windows">Section 3.4.3, “Starting and Stopping the Agent on Windows”</a>.
        </p><p>
          You can confirm the location of the agent log files by
          checking the <code class="filename">ini</code> file. For more
          information on this topic see
          <a href="#mnmas-about-mysql-service-agent-ini" title="3.5.1. The mysql-service-agent.ini File">Section 3.5.1, “The <code class="filename">mysql-service-agent.ini</code> File”</a>.
        </p><p>
          Go to the command line and remove the MySQL Network Service Agent as a
          Windows service by typing:
        </p><pre class="programlisting">C:\&gt; <strong class="userinput"><code>sc delete <em class="replaceable"><code>AgentName</code></em></code></strong>
</pre><p>
          You can confirm that the agent has been removed by checking
          the Microsoft Management Console Services window. There should
          no longer be an entry for the removed agent.
        </p><p>
          You should also remove or archive any log or configuration
          files associated with this agent. If you have installed any
          additional agents, remove them in the same fashion.
        </p></div></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-unix-osx-removal"></a>11.2. Removing the MySQL Network Monitoring and Advisory Service: Unix and Mac OS X</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#id2481066">11.2.1. Removing the MySQL Network Monitoring and Advisory Service Server</a></span></dt><dt><span class="section"><a href="#mnmas-removing-service-agent-unix-osx">11.2.2. Removing the Service Agent</a></span></dt></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="id2481066"></a>11.2.1. Removing the MySQL Network Monitoring and Advisory Service Server</h3></div></div></div><p>
        To remove the MySQL Network Service Manager, find the
        <code class="filename">uninstall</code> file in the
        <code class="filename">/opt/mysql/network/monitoring</code> directory.
      </p><p>
        Execute this file by typing:
      </p><pre class="programlisting">shell&gt; <strong class="userinput"><code>./uninstall</code></strong>
</pre><p>
        During the uninstall process you will be given the option of
        saving existing data and log files. Choose this option if you
        plan to reinstall the MySQL Network Monitoring and Advisory Service.
      </p><p>
        If you are not saving existing data, after uninstalling the
        MySQL Network Service Manager you may remove the
        <code class="filename">/opt/mysql/network/monitoring</code> directory.
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          If you chose not to remove existing data and log files when
          uninstalling the MySQL Network Monitoring and Advisory Service do
          <span class="bold"><strong>not</strong></span> remove the
          <code class="filename">/opt/mysql/network/monitoring</code> directory;
          doing so will delete these files.
        </p></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="mnmas-removing-service-agent-unix-osx"></a>11.2.2. Removing the Service Agent</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#mnmas-remove-single-agent-unix">11.2.2.1. Removing a Single Agent</a></span></dt></dl></div><p>
        Prior to removal of the Service Agent Service you should stop
        any agents. Do this by changing to the
        <code class="filename">init.d</code> directory and issuing the command,
        <span><strong class="command">./mysql-service-agent stop
        <em class="replaceable"><code>[ini_filename]</code></em></strong></span>. You only
        need specify the <code class="filename">ini</code> file name if you have
        moved the file from its default location or you are running more
        than one agent. If specifying the <code class="filename">ini</code> file
        name, use the complete path.
      </p><p>
        You will find the <code class="filename">uninstall</code> file in the
        <code class="filename">/opt/mysql/network/agent</code> directory under
        Unix and in the
        <code class="filename">/Applications/mysql/network/agent</code> directory
        on Mac OS X. Execute this file by navigating to this directory
        and typing:
      </p><div class="warning" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Warning</h3><p>
          If you are running more than one agent on the same machine and
          wish to remove only one of the agents, do
          <span class="bold"><strong>not</strong></span> run the uninstall
          program. To remove a single agent see
          <a href="#mnmas-removing-service-agent-unix-osx" title="11.2.2. Removing the Service Agent">Section 11.2.2, “Removing the Service Agent”</a>.
        </p></div><pre class="programlisting">shell&gt; <strong class="userinput"><code>./uninstall</code></strong>
</pre><p>
        After uninstalling the Service Agent you may remove the
        <code class="filename">/opt/mysql/network/agent</code> directory. Under
        Mac OS X this directory is called
        <code class="filename">/Applications/mysql/network/agent</code>.
      </p><p>
        Removing the Service Agent in this fashion will remove the
        default service. However, if you are running additional Service
        Agents as described in <a href="#mnmas-install-agent-multi" title="3.5.2. Monitoring Multiple Servers">Section 3.5.2, “Monitoring Multiple Servers”</a>,
        you will have to remove those agents manually. See the next
        section for instructions on doing this.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="mnmas-remove-single-agent-unix"></a>11.2.2.1. Removing a Single Agent</h4></div></div></div><p>
          If you are running more than one agent on the same machine and
          wish to remove only one of the agents, do
          <span class="bold"><strong>not</strong></span> run the uninstall
          program. To remove a single agent and leave other agents
          intact follow these steps:
        </p><div class="orderedlist"><ol type="1"><li><p>
              Stop the agent
            </p></li><li><p>
              Confirm the location of the log files
            </p></li><li><p>
              Remove the agent as a service
            </p></li><li><p>
              Remove/Archive associated files
            </p></li></ol></div><p>
          It is best to stop the agent before removing it; for
          instructions on stopping an agent see:

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                Unix – <a href="#mnmas-starting-agent-unix" title="3.4.6. Starting and Stopping the Agent on Unix">Section 3.4.6, “Starting and Stopping the Agent on Unix”</a>
              </p></li><li><p>
                Mac OS X – <a href="#mnmas-starting-agent-osx" title="3.4.4. Starting and Stopping the Agent on Mac OS X">Section 3.4.4, “Starting and Stopping the Agent on Mac OS X”</a>
              </p></li></ul></div><p>
        </p><p>
          You can confirm the location of the agent log files by
          checking the <code class="filename">ini</code> file. For more
          information on this topic see
          <a href="#mnmas-about-mysql-service-agent-ini" title="3.5.1. The mysql-service-agent.ini File">Section 3.5.1, “The <code class="filename">mysql-service-agent.ini</code> File”</a>.
        </p><p>
          You may then remove the agent as a daemon by removing its
          entry in the <code class="filename">init.d</code> directory. You should
          also remove or archive any log or configuration files
          associated with this agent.
        </p><p>
          If you have installed any additional agents, remove them in
          the same fashion.
        </p></div></div></div></div><div class="appendix" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-log-files"></a>Appendix A. Files Associated with The MySQL Network Monitoring and Advisory Service</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#mnmas-server-log-files">A.1. Log Files for the MySQL Network Service Manager</a></span></dt><dt><span class="section"><a href="#mnmas-agent-manager-installation-log-files">A.2. Service Agent and Service Manager Installation Log Files</a></span></dt><dt><span class="section"><a href="#mnmas-agent-log-and-pid-files">A.3. Agent Log and PID Files</a></span></dt><dt><span class="section"><a href="#mnmas-mib-file-location">A.4. The Management Information Base (MIB) File</a></span></dt></dl></div><p>
    This section details the files associated with the MySQL Network Monitoring and Advisory Service
    and shows their default location.    
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-server-log-files"></a>A.1. Log Files for the MySQL Network Service Manager</h2></div></div></div><p>
      This section shows the location of the log files associated with
      the various components that make up the MySQL Network Service Manager.
      These files can prove useful for debugging purposes.
    </p><p>
      A table showing the log file locations on Windows follows.
    </p><div class="table"><a name="id2481449"></a><p class="title"><b>Table A.1. Log file locations – Windows</b></p><table summary="Log file locations – Windows" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Component</strong></span></th><th><span class="bold"><strong>File Location</strong></span></th></tr></thead><tbody><tr><td>Apache/Tomcat</td><td>C:\Program Files\MySQL\Network\Monitoring\apache-tomcat\logs</td></tr><tr><td>Repository</td><td>C:\Program Files\MySQL\Network\Monitoring\apache-tomcat\webapps\merlin\mysql\data</td></tr><tr><td>Configuration Report</td><td>C:\Program Files\MySQL\Network\Monitoring\configuration_report.txt</td></tr></tbody></table></div><p>
      A table showing the log file locations on Unix follows.
    </p><div class="table"><a name="id2481532"></a><p class="title"><b>Table A.2. Log file locations – Unix</b></p><table summary="Log file locations – Unix" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Component</strong></span></th><th><span class="bold"><strong>File Location</strong></span></th></tr></thead><tbody><tr><td>Apache/Tomcat</td><td>/opt/mysql/network/monitoring/apache-tomcat/logs</td></tr><tr><td>Repository</td><td>/opt/mysql/network/monitoring/apache-tomcat/webapps/merlin/mysql/data</td></tr><tr><td>Configuration Report</td><td>/opt/mysql/network/monitoring/configuration_report.txt</td></tr></tbody></table></div><p>
      Find below a table showing the log file locations on Mac OS X.
    </p><div class="table"><a name="id2481614"></a><p class="title"><b>Table A.3. Log file locations – Mac OS X</b></p><table summary="Log file locations – Mac OS X" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Component</strong></span></th><th><span class="bold"><strong>File Location</strong></span></th></tr></thead><tbody><tr><td>Apache/Tomcat</td><td>/Applications/mysql/network/monitoring/apache-tomcat/logs</td></tr><tr><td>Repository</td><td>/Applications/mysql/network/monitoring/apache-tomcat/webapps/merlin/mysql/data</td></tr><tr><td>Configuration Report</td><td>/Applications/mysql/network/monitoring/configuration_report.txt</td></tr></tbody></table></div><div class="note" style="margin-left: 0.5in; margin-right: 0.5in;"><h3 class="title">Note</h3><p>
        The <code class="filename">configuration_report.txt</code> file contains
        The Repository password in plain text. You may want to store this file in
        a secure location.
      </p></div><p>
      On all operating systems, the Apache/Tomcat, and Repository
      directories contain both access and error files.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-agent-manager-installation-log-files"></a>A.2. Service Agent and Service Manager Installation Log Files</h2></div></div></div><p>
      These log files are called
      <code class="filename">bitrock_installer.log</code>.
    </p><p>
      On Windows these files are stored in the temporary directory
      defined by the variable <code class="literal">%TEMP%</code>. To determine the
      value of <code class="literal">%TEMP%</code> on your system, type
      <span><strong class="command">echo %TEMP%</strong></span> at the command line. Alternately,
      you may open the <code class="literal">Run</code> command window, enter
      <code class="literal">%TEMP%</code> and press <span class="guibutton">OK</span>.
      To find this file on Unix and Mac OS X check the value of the 
      environment variable, <code class="literal">$TMPDIR</code>. If this variable is not
      defined, look in the <code class="filename">/tmp</code> directory.
    </p><p>
      If the file <code class="filename">bitrock_installer.log</code> already
      exists, a file called
      <code class="filename">bitrock_installer_<em class="replaceable"><code>xxxx</code></em>.log</code>
      (where <em class="replaceable"><code>xxxx</code></em> stands for an arbitrary
      series of numerals) will be created.
    </p><p>
      To determine if an installation file belongs to the Service Agent or
      the Service Manager you must open the file in a text editor.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-agent-log-and-pid-files"></a>A.3. Agent Log and PID Files</h2></div></div></div><p>
      The locations of the agent log files are as follows:
    </p><div class="itemizedlist"><ul type="disc"><li><p>
          Windows – <code class="filename">C:\Program
          Files\MySQL\Network\Agent\mysql-service-agent.log</code>
        </p></li><li><p>
          Unix – <code class="filename">/opt/mysql/network/agent/log</code>
        </p></li><li><p>
          Mac OS X –
          <code class="filename">/Applications/mysql/network/agent/log</code>
        </p></li></ul></div><p>
      On any platform, the location of the agent log file may
      be changed. To confirm the location check the settings in
      the <code class="filename">mysql-service-agent.ini</code> file.
    </p><p>
      The locations of the agent <code class="filename">pid</code> files are as follows:
    </p><p>
      </p><div class="itemizedlist"><ul type="disc"><li><p>
            Windows – <code class="filename">C:\Program
            Files\MySQL\Network\Agent\mysql-service-agent.pid</code>
          </p></li><li><p>
            Unix –
            <code class="filename">/opt/mysql/network/agent/run/mysql-service-agent.pid</code>
          </p></li><li><p>
            Mac OS X –
            <code class="filename">/Applications/mysql/network/agent/run/mysql-service-agent.pid</code>
          </p></li></ul></div><p>
    </p><p>
      On any platform, the location of the this file may
      be changed. To confirm the location check the settings in
      the <code class="filename">mysql-service-agent.ini</code> file.
    </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="mnmas-mib-file-location"></a>A.4. The Management Information Base (MIB) File</h2></div></div></div><p>
      A MIB file is a requirement for using SNMP traps.
      A table showing the location of this file follows.
    </p><div class="table"><a name="id2481978"></a><p class="title"><b>Table A.4. MIB file locations</b></p><table summary="MIB file locations" border="1"><colgroup><col><col></colgroup><thead><tr><th><span class="bold"><strong>Operating System</strong></span></th><th><span class="bold"><strong>File Location</strong></span></th></tr></thead><tbody><tr><td>Windows</td><td>C:\Program Files\MySQL\Network\Monitoring\support-files\MNMAS.MIB</td></tr><tr><td>Linux</td><td>/opt/mysql/metwork/monitoring/support-files/MNMAS.MIB</td></tr><tr><td>Mac OS X</td><td>/Application/mysql/metwork/monitoring/support-files/MNMAS.MIB</td></tr></tbody></table></div></div></div><div class="appendix" lang="en"><div class="titlepage"><div><div><h2 class="title"><a name="mnmas-change-history"></a>Appendix B. The MySQL Network Monitoring and Advisory Service Change History</h2></div></div></div><div class="toc"><p><b>Table of Contents</b></p><dl><dt><span class="section"><a href="#changes-1.2.x">B.1. Changes in Release 1.2.x</a></span></dt><dd><dl><dt><span class="section"><a href="#release-1.2">B.1.1. Changes in Release 1.2 (Not Yet Released)</a></span></dt></dl></dd></dl></div><p>
    This appendix lists the changes to the MySQL Network Monitoring and Advisory Service, beginning with the
    most recent release. Each release section covers added or changed
    functionality, bug fixes, and known issues, if applicable. Changes
    to the MySQL Network Service Manager are shown first, followed by changes to the
    MySQL Network Service Agent. All bug fixes are referenced by bug number and
    include a link to the bug database. Bugs are listed in order of
    resolution. To find a bug quickly, search by bug number.

    
  </p><p>
    <span class="bold"><strong>Note:</strong></span> Bugs that do not affect the
    user's interaction with MySQL Network Monitoring and Advisory Service are not documented.
  </p><div class="section" lang="en"><div class="titlepage"><div><div><h2 class="title" style="clear: both"><a name="changes-1.2.x"></a>B.1. Changes in Release 1.2.x</h2></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#release-1.2">B.1.1. Changes in Release 1.2 (Not Yet Released)</a></span></dt></dl></div><div class="section" lang="en"><div class="titlepage"><div><div><h3 class="title"><a name="release-1.2"></a>B.1.1. Changes in Release 1.2 (Not Yet Released)</h3></div></div></div><div class="toc"><dl><dt><span class="section"><a href="#functionality-1.2">B.1.1.1. Functionality Added or Changed</a></span></dt><dt><span class="section"><a href="#bugs-fixed-1.2">B.1.1.2. Bugs Fixed</a></span></dt><dt><span class="section"><a href="#known-issues-1.2">B.1.1.3. Known Issues 1.2</a></span></dt></dl></div><p>
        This section documents all changes and bug fixes that have been
        applied since the release of MySQL Network Monitoring and Advisory Service, version 1.1.1.
      </p><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="functionality-1.2"></a>B.1.1.1. Functionality Added or Changed</h4></div></div></div><p>
          Agent:

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                If the agent could not connect to the MySQL Network Service Manager,
                more and more RAM was consumed as the agent stored
                information to memory rather than to the repository. To
                combat this problem, a default timeout option,
                <code class="literal">backlog-threshold</code>, has been added to
                the agent configuration file. After 10 minutes, entries
                in the backlog are discarded. For more information see
                <a href="#mnmas-configure-backlog-threshold" title="3.5.1.3.2. The backlog-threshold Option">Section 3.5.1.3.2, “The<code class="literal"> backlog-threshold</code> Option”</a>.
                (<a href="http://bugs.mysql.com/26882" target="_top">Bug#26882</a>)
              </p></li><li><p>
                If an error was encountered while importing advisors,
                the process stopped. Importing now continues even if a
                bad advisor or graph is encountered. Errors are reported
                when importation is complete. (<a href="http://bugs.mysql.com/25536" target="_top">Bug#25536</a>)
              </p></li></ul></div><p>
        </p></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="bugs-fixed-1.2"></a>B.1.1.2. Bugs Fixed</h4></div></div></div><p>
          Service Manager and the Dashboard:
        </p><div class="itemizedlist"><ul type="disc"><li><p>
              The service manager could not monitor servers where the
              value of the server id exceeded the bounds of a signed
              int. (<a href="http://bugs.mysql.com/28467" target="_top">Bug#28467</a>)
            </p></li><li><p>
              The service manager installation failed when the Dashboard
              credentials used a password that included special
              characters such as ‘<code class="literal">$</code>’ and
              ’<code class="literal">'</code>‘. (<a href="http://bugs.mysql.com/26868" target="_top">Bug#26868</a>)
            </p></li><li><p>
              On AIX 5.2, an invalid CPU frequency (-1) showed in the
              <code class="literal">Meta Info</code> section of the <code class="literal">Heat
              Chart</code>. (<a href="http://bugs.mysql.com/28207" target="_top">Bug#28207</a>)
            </p></li><li><p>
              An incorrect email address and/or password for MySQL
              Enterprise credentials resulted in a MySQL website
              generated error. The Enterprise Dashboard now handles this
              error. (<a href="http://bugs.mysql.com/28966" target="_top">Bug#28966</a>)
            </p></li></ul></div><p>
          Agent:
        </p><div class="itemizedlist"><ul type="disc"><li><p>
              Post-installation steps failed on FreeBSD 6.2 with x86_64
              architecture. (<a href="http://bugs.mysql.com/29089" target="_top">Bug#29089</a>)
            </p></li><li><p>
              If the agent was started as a service on Windows, no
              <code class="filename">.pid</code> file was created. (<a href="http://bugs.mysql.com/28615" target="_top">Bug#28615</a>)
            </p></li><li><p>
              The rule, “<span class="quote">InnoDB Redo Logs Not Sized
              Correctly</span>”, did not take into account buffer pools
              greater than 2 GBs in size. This rule has been rewritten.
              (<a href="http://bugs.mysql.com/29388" target="_top">Bug#29388</a>)
            </p></li></ul></div></div><div class="section" lang="en"><div class="titlepage"><div><div><h4 class="title"><a name="known-issues-1.2"></a>B.1.1.3. Known Issues 1.2</h4></div></div></div><p>
          The following issues will be fixed in an upcoming maintenance
          release. See each individual item for information on
          workarounds or current status.

          </p><div class="itemizedlist"><ul type="disc"><li><p>
                Under Windows, when the agent file is run from the
                command line specifying the <code class="option">-help</code>
                option, a Tclkit dialog box opens. Use the
                <code class="option">--help</code> option and redirect output to
                file. For more information see
                <a href="#mnmas-command-line-options-service-agent" title="3.7.1.2. MySQL Network Service Agent Options">Section 3.7.1.2, “MySQL Network Service Agent Options”</a>.
                (<a href="http://bugs.mysql.com/23218" target="_top">Bug#23218</a>)
              </p></li><li><p>
                Logging in with a DBA account adds an exception to the
                <code class="literal">Log</code> (now renamed
                <code class="literal">Misc</code>) log. When a DBA logs in, the
                error message, <code class="literal">User role "dba" is not
                authorized</code> appears in the log. (<a href="http://bugs.mysql.com/26554" target="_top">Bug#26554</a>)
              </p></li><li><p>
                If you upgrade the monitored MySQL server, the agent must
                be restarted in order to run the
                <code class="literal">list_known_items</code> file. For a
                workaround when upgrading see
                <a href="#mnmas-ungrading-monitored-server" title="4.1. Upgrading the Monitored MySQL Server">Section 4.1, “Upgrading the Monitored MySQL Server”</a>.
                (<a href="http://bugs.mysql.com/24068" target="_top">Bug#24068</a>)
              </p></li><li><p>
                There are minor “<span class="quote">meta info</span>” reporting issues
                when an agent is remotely monitoring a MySQL server.
                This issue is under consideration. For more information
                see <a href="#mnmas-install-agent-remote" title="3.5.3. Configuring an Agent to Monitor a Remote MySQL Server">Section 3.5.3, “Configuring an Agent to Monitor a Remote MySQL Server”</a>. (<a href="http://bugs.mysql.com/22497" target="_top">Bug#22497</a>)
              </p></li><li><p>
                The Service Manager currently sends email using the
                JavaMail API. This API has no support for sending or
                receiving secure email. However, the architecture of the
                JavaMail API allows such support to be easily added by
                third parties. For more information about email security
                standards, Secure/Multipurpose Internet Mail Extensions
                (S/MIME) and Pretty Good Privacy (PGP), see
                <a href="http://www.imc.org/smime-pgpmime.html." target="_top">http://www.imc.org/smime-pgpmime.html.</a>.
                Please browse our Third Party Products
                (<a href="http://solutions.mysql.com/solutions/partners/" target="_top">http://solutions.mysql.com/solutions/partners/</a>) page
                for solutions from other vendors. (<a href="http://bugs.mysql.com/24423" target="_top">Bug#24423</a>)
              </p></li><li><p>
                The rule, <code class="literal">Account Without Password</code>,
                reports only one account without a password, not all
                accounts without a password. (<a href="http://bugs.mysql.com/15165" target="_top">Bug#15165</a>)
              </p></li><li><p>
                When viewing the results of an event in the
                <code class="literal">Events</code> tab, the
                <code class="literal">Notifications</code> section shows the time
                the results are viewed not the time the event was
                triggered.
                (<a href="http://bugs.mysql.com/26349" target="_top">Bug#26349</a>)
              </p></li></ul></div><p>
        </p><p>
          For a more current list of known problems, browse to
          <a href="http://bugs.mysql.com/search.php" target="_top">http://bugs.mysql.com/search.php</a> and
          multi-select all sub-categories under <code class="literal">MySQL
          Network</code>, found near the bottom of the category list.
        </p></div></div></div></div></div>
